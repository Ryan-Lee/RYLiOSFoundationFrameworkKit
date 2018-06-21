//
//  IOTBaseTabBarController.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/19.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOTBaseTabBarController : UITabBarController

- (void)commonSetup;

- (void)setupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage addNav:(BOOL)addNav;

@end
