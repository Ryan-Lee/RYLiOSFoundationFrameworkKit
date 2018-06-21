//
//  IOTNavigationController.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/21.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOTNavigationController : UINavigationController

///配置全局所有VC导航栏返回按钮
@property (nonatomic, copy) NSString *backIndicatorImageName;
///隐藏导航栏下面那条细线
@property (nonatomic) BOOL hideHairlineUnderNavigationBar;
@end
