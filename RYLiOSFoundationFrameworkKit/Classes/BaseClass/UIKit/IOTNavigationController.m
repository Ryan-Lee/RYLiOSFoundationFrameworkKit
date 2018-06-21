//
//  IOTNavigationController.m
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/21.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import "IOTNavigationController.h"

@interface IOTNavigationController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) id<UIGestureRecognizerDelegate> interactivePopGestureRecognizerDelegate;
@end

@implementation IOTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBarUI];
    self.interactivePopGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

#pragma mark - 配置navigation bar
- (void)setupNavigationBarUI {
//    self.navigationBar.tintColor = [UIColor lightGrayColor];
    self.navigationBar.translucent = NO;    
    if (self.backIndicatorImageName) {
        self.navigationBar.backIndicatorImage = [UIImage imageNamed:self.backIndicatorImageName];
        self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:self.backIndicatorImageName];
    }
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
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = hideHairlineUnderNavigationBar;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    if (self.viewControllers.count > 1) {
//        return YES;
//    }
//    return NO;;
//}

//    切记本方法内此处代码顺序不能颠倒！！！
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
////  根VC显示tabbar，其他VC不显示tabbar
//    if (self.viewControllers.count >= 1) {
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    
//    [super pushViewController:viewController animated:animated];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
