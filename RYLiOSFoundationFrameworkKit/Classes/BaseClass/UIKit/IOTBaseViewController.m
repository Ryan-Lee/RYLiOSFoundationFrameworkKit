//
//  IOTBaseViewController.m
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/19.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import "IOTBaseViewController.h"
#import <Toast/Toast.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface IOTBaseViewController ()<UIGestureRecognizerDelegate>
//@property (strong, nonatomic) id <UIGestureRecognizerDelegate> interactivePopGestureRecognizerDelegate;

@end

@implementation IOTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self dataInit];
    [self commonSetup];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"控制器：%@ 已销毁", self);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:self.hideNavigationBar animated:YES];
    }
}

//导航栈根VC显示tabbar，其他VC不显示tabbar
- (BOOL)hidesBottomBarWhenPushed {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        return YES;
    }
    return [super hidesBottomBarWhenPushed];
}

- (NSString *)description {
    return self.title.length > 0 ? [NSString stringWithFormat:@"%@.title:%@", [super description], self.title] : [NSString stringWithFormat:@"%@.title:%@", [super description], self.navigationItem.title];
}

- (void)popSelfAndPushNextVC:(UIViewController *)vc {
    NSMutableArray <UIViewController *>*vcs = self.navigationController.viewControllers.mutableCopy;
    [vcs removeLastObject];
    [vcs addObject:vc];
    [self.navigationController setViewControllers:vcs animated:YES];
}

#pragma mark - 通用设置方法，用于设置所有VC的共同行为、属性、界面
- (void)commonSetup {
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    设置导航栏返回🔙按钮标题为空
//    if (self.hideBackBarButtonItemTitle) {
//        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    }
}

#pragma mark - 初始化数据，由子类继承重写
- (void)dataInit {
}

#pragma mark - 搭界面方法，由子类继承重写
- (void)setupUI {
}

- (void)popbackNavigationVC {
    
}

#pragma mark - property accessor

///    设置导航栏返回🔙按钮标题为空
- (void)setHideBackBarButtonItemTitle:(BOOL)hideBackBarButtonItemTitle {
    _hideBackBarButtonItemTitle = hideBackBarButtonItemTitle;
    if (hideBackBarButtonItemTitle) {
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(popbackNavigationVC)];
    } else {
        if (self.title.length) {
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:self action:@selector(popbackNavigationVC)];
        } else {
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.navigationItem.title style:UIBarButtonItemStylePlain target:self action:@selector(popbackNavigationVC)];
        }
    }
}

- (void)setHideNavigationBar:(BOOL)hideNavigationBar {
    _hideNavigationBar = hideNavigationBar;
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:hideNavigationBar animated:YES];
    }
}

- (void)inputTextEmptyTip {
    [self.view makeToast:@"输入不能为空"];
}

- (void)inputTextEmptyWithTips:(NSString *)tips {
    [self.view makeToast:tips];
}

- (void)showToastTipsWithString:(NSString *)text {
    [self.view makeToast:text];
}

- (void)showToastTipsWithString:(NSString *)text position:(IOTTipsToastViewPosition)position {
    switch (position) {
        case IOTTipsToastViewPositionTop:
            [self.view makeToast:text duration:3 position:CSToastPositionTop];
            break;
            
        case IOTTipsToastViewPositionCenter:
            [self.view makeToast:text duration:3 position:CSToastPositionCenter];
            break;
            
        case IOTTipsToastViewPositionBottom:
            [self.view makeToast:text duration:3 position:CSToastPositionBottom];
            break;
            
        default:
            break;
    }
}

- (void)showLoadingActivityViewInKeyWindowWithString:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
    hud.detailsLabel.text = text;
    hud.removeFromSuperViewOnHide = YES;
}

- (void)hideLoadingActivityViewInKeyWindow {
    [MBProgressHUD hideHUDForView:self.view.window animated:YES];
}

- (void)showLoadingActivityViewWithString:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.detailsLabel.text = text;
    hud.removeFromSuperViewOnHide = YES;
}

- (void)hideLoadingActivityView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)setHideHairlineUnderNavigationBar:(BOOL)hideHairlineUnderNavigationBar {
    _hideHairlineUnderNavigationBar = hideHairlineUnderNavigationBar;
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = hideHairlineUnderNavigationBar;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
