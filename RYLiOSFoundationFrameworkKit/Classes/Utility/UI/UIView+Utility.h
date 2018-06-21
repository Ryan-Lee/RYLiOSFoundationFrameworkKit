//
//  UIView+Utility.h
//  AFNetworking
//
//  Created by RyanLee on 2018/3/27.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)

///坐标便利访问器
@property (nonatomic, assign) CGFloat crdX;
@property (nonatomic, assign) CGFloat crdY;
@property (nonatomic, assign) CGFloat crdRightX;
@property (nonatomic, assign) CGFloat crdBottomY;
@property (nonatomic, assign) CGFloat crdCenterX;
@property (nonatomic, assign) CGFloat crdCenterY;
@property (nonatomic, assign) CGFloat crdWidth;
@property (nonatomic, assign) CGFloat crdHeight;
@property (nonatomic, assign) CGSize crdSize;
@property (nonatomic, assign) CGPoint crdOrigin;

///在本视图上弹toast提示
- (void)showToastTipsWithString:(NSString *)text;

+ (void)showToastTipsInKeyWindowWithString:(NSString *)text;
@end
