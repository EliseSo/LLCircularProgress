//
//  CircleView.h
//  CircleLayer
//
//  Created by Fuzzie Liu on 16/6/29.
//  Copyright © 2016年 Fuzzie Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property (strong, nonatomic) UIColor *strokeColor;
@property (strong, nonatomic) UIColor *fillColor;
@property (nonatomic) CGFloat strokeWidth;
@property (nonatomic) CGFloat startValue;
@property (nonatomic) CGFloat endValue;

@end
