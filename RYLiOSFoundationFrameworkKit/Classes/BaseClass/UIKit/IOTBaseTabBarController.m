//
//  IOTBaseTabBarController.m
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/19.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import "IOTBaseTabBarController.h"
#import "IOTNavigationController.h"

@interface IOTBaseTabBarController ()

@end

@implementation IOTBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commonSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commonSetup {
    self.tabBar.translucent = NO;
}

- (void)setupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage addNav:(BOOL)addNav
{
    childVc.title = title;
    UIViewController *vc = addNav?[[IOTNavigationController alloc] initWithRootViewController:childVc]:childVc;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:vc];
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
