//
//  CircleView.m
//  CircleLayer
//
//  Created by Fuzzie Liu on 16/6/29.
//  Copyright © 2016年 Fuzzie Liu. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()
@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@end

@implementation CircleView

- (CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        _shapeLayer.strokeColor = self.strokeColor.CGColor;
        _shapeLayer.fillColor = self.fillColor.CGColor;
        _shapeLayer.lineWidth = self.strokeWidth;
        _shapeLayer.strokeStart = self.startValue;
        _shapeLayer.strokeEnd = self.endValue;
        _shapeLayer.frame = self.bounds;
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
}

- (void)setStrokeColor:(UIColor *)strokeColor{
    self.shapeLayer.strokeColor = strokeColor.CGColor;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth{
    self.shapeLayer.lineWidth = strokeWidth;
}

- (void)setFillColor:(UIColor *)fillColor{
    self.shapeLayer.fillColor = fillColor.CGColor;
}

- (void)setStartValue:(CGFloat)startValue{
    self.shapeLayer.strokeStart = startValue;
}

- (void)setEndValue:(CGFloat)endValue{
    self.shapeLayer.strokeEnd = endValue;
}


@end
