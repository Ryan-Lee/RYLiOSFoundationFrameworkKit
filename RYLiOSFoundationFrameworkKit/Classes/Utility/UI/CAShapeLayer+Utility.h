//
//  CAShapeLayer+Utility.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/25.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (Utility)
//画虚线
+ (CAShapeLayer *)strokeDashLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint dashPattern:(NSArray<NSNumber *> *)dashPattern strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)lineWidth;

@end
