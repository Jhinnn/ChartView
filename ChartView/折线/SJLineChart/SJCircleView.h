//
//  SJCircleView.h
//  SJChartViewDemo
//
//  Created by Jaesun on 16/9/8.
//  Copyright © 2016年 S.J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJCircleView : UIView

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius;

@end
