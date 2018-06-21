//
//  UIView+Utility.m
//  AFNetworking
//
//  Created by RyanLee on 2018/3/27.
//

#import "UIView+Utility.h"
#import <Toast/Toast.h>

@implementation UIView (Utility)

- (CGFloat)crdX {
    return CGRectGetMinX(self.frame);
}

- (void)setCrdX:(CGFloat)crdX {
    CGRect frame = self.frame;
    frame.origin.x = crdX;
    self.frame = frame;
}

- (CGFloat)crdY {
    return CGRectGetMinY(self.frame);
}

- (void)setCrdY:(CGFloat)crdY {
    CGRect frame = self.frame;
    frame.origin.y = crdY;
    self.frame = frame;
}

- (CGFloat)crdRightX {
    return CGRectGetMaxX(self.frame);
}

- (void)setCrdRightX:(CGFloat)crdRightX {
    CGRect frame = self.frame;
    frame.origin.x = crdRightX - self.crdWidth;
    self.frame = frame;
}

- (CGFloat)crdBottomY {
    return CGRectGetMaxY(self.frame);
}

- (void)setCrdBottomY:(CGFloat)crdBottomY {
    CGRect frame = self.frame;
    frame.origin.y = crdBottomY - self.crdHeight;
    self.frame =frame;
}

- (CGFloat)crdCenterX {
    return self.center.x;
}

- (void)setCrdCenterX:(CGFloat)crdCenterX {
    CGPoint center = self.center;
    center.x = crdCenterX;
    self.center = center;
}

- (CGFloat)crdCenterY {
    return self.center.y;
}

- (void)setCrdCenterY:(CGFloat)crdCenterY {
    CGPoint center = self.center;
    center.y = crdCenterY;
    self.center = center;
}

- (CGFloat)crdWidth {
    return CGRectGetWidth(self.frame);
}

- (void)setCrdWidth:(CGFloat)crdWidth {
    CGRect frame = self.frame;
    frame.size.width = crdWidth;
    self.frame = frame;
}

- (CGFloat)crdHeight {
    return CGRectGetHeight(self.frame);
}

- (void)setCrdHeight:(CGFloat)crdHeight {
    CGRect frame = self.frame;
    frame.size.height = crdHeight;
    self.frame = frame;
}

- (CGSize)crdSize {
    return self.frame.size;
}

- (void)setCrdSize:(CGSize)crdSize {
    CGRect frame = self.frame;
    frame.size = crdSize;
    self.frame = frame;
}

- (CGPoint)crdOrigin {
    return self.frame.origin;
}

- (void)setCrdOrigin:(CGPoint)crdOrigin {
    CGRect frame = self.frame;
    frame.origin = crdOrigin;
    self.frame = frame;
}

- (void)showToastTipsWithString:(NSString *)text {
    [self makeToast:text];
}

+ (void)showToastTipsInKeyWindowWithString:(NSString *)text {
    UIWindow *keywindow = UIApplication.sharedApplication.keyWindow;
    [keywindow showToastTipsWithString:text];
}

@end
