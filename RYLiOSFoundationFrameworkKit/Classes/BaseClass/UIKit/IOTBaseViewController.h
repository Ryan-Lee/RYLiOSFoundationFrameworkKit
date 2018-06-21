//
//  IOTBaseViewController.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/19.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralCommonUtilityMacroHeader.h"

#define convenienceCheckTextNotEmptyOrReturn(string) CheckTextNotEmptyOrReturn(string,self,@selector(inputTextEmptyTip))

typedef NS_ENUM(NSUInteger, IOTTipsToastViewPosition) {
    IOTTipsToastViewPositionTop,
    IOTTipsToastViewPositionCenter,
    IOTTipsToastViewPositionBottom,
};

///共同行为：导航栏返回按钮没文字，内存释放提示，释放自动移除通知监视
@interface IOTBaseViewController : UIViewController

///是否隐藏导航栏返回按钮的标题，需在[super viewDidLoad]调用前设置才有用，不隐藏不用设置此属性
@property (nonatomic) IBInspectable BOOL hideBackBarButtonItemTitle;

///是否隐藏导航栏，不隐藏不用设置此属性
@property (nonatomic) IBInspectable BOOL hideNavigationBar;

///初始化数据，由子类继承重写
- (void)dataInit;

///搭界面方法，由子类继承重写
- (void)setupUI;

///导航pop返回前自动调用，需先设置hideBackBarButtonItemTitle
- (void)popbackNavigationVC;

///动画化pop当前vc，并push下个vc
- (void)popSelfAndPushNextVC:(UIViewController *)vc;

///通用设置方法，用于设置所有VC父类的共同行为、属性、界面，如果需要重新定制全局所有VC的配置可继承此方法，继承时最好调用[super commonSetup]，视情况而定，如果想继承本类做通用VC可以重写此方法
- (void)commonSetup;

///如果界面中有UITextField之类的文本输入控件，检测为空时可直接调用此方法提示，可以配合CheckTextNotEmptyOrReturn宏食用
- (void)inputTextEmptyTip;

///如果界面中有UITextField之类的文本输入控件，检测为空时可直接调用此方法提示，可以配合CheckTextNotEmptyOrReturnWithTips宏食用
- (void)inputTextEmptyWithTips:(NSString *)tips;

///隐藏导航栏下面那条细线
@property (nonatomic) BOOL hideHairlineUnderNavigationBar;

///弹toast类提示，参考： https://github.com/scalessec/Toast ， 默认位置在IOTTipsToastViewPositionBottom
- (void)showToastTipsWithString:(NSString *)text;

- (void)showToastTipsWithString:(NSString *)text position:(IOTTipsToastViewPosition)position;

///网络请求等长时操作弹菊花，模态在keyWindow上，即不能返回🔙
- (void)showLoadingActivityViewInKeyWindowWithString:(NSString *)text;

///隐藏菊花网络请求等长时操作，模态在keyWindow上，即不能返回🔙
- (void)hideLoadingActivityViewInKeyWindow;

///网络请求等长时操作弹菊花,模态在self.view上，可以返回🔙
- (void)showLoadingActivityViewWithString:(NSString *)text;

///隐藏菊花网络请求等长时操作，模态在self.view上，可以返回🔙
- (void)hideLoadingActivityView;

@end
