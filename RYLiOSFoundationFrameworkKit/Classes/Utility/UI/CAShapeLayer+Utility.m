//
//  CAShapeLayer+Utility.m
//  IOTHomeFoundation
//
//  Created by RyanLee on 2017/12/25.
//  Copyright © 2017年 cniotroot.cn. All rights reserved.
//

#import "CAShapeLayer+Utility.h"

@implementation CAShapeLayer (Utility)
+ (CAShapeLayer *)strokeDashLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint dashPattern:(NSArray<NSNumber *> *)dashPattern strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)lineWidth {
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = strokeColor.CGColor;
    line.lineWidth = lineWidth;
    line.lineDashPattern = dashPattern;
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:startPoint];
    [linePath addLineToPoint:endPoint];
    linePath.lineWidth = lineWidth;
    line.path = linePath.CGPath;
    return line;
}

@end
