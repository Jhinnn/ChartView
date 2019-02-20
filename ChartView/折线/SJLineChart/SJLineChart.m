//
//  SJLineChart.m
//  SJChartViewDemo
//
//  Created by Jaesun on 16/9/9.
//  Copyright © 2016年 S.J. All rights reserved.
//

#import "SJLineChart.h"

#import "SJChartLineView.h"
#import "SJAxisView.h"

@interface SJLineChart() {
    
    NSMutableArray *xMarkTitles;
    NSMutableArray *valueArray;
    
}

/**
 *  表名标签
 */
@property (nonatomic, strong) UILabel *titleLab;

/**
 *  显示折线图的可滑动视图
 */
@property (nonatomic, strong) UIScrollView *scrollView;

/**
 *  折线图
 */
@property (nonatomic, strong) SJChartLineView *chartLineView;

/**
 *  X轴刻度标签 和 对应的折线图点的值
 */
@property (nonatomic, strong) NSArray *xMarkTitlesAndValues;

@end

@implementation SJLineChart

- (void)setXScaleMarkLEN:(CGFloat)xScaleMarkLEN {
    _xScaleMarkLEN = xScaleMarkLEN;
}

- (void)setYMarkTitles:(NSArray *)yMarkTitles {
    _yMarkTitles = yMarkTitles;
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
 
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
}

- (void)setXMarkTitlesAndValues:(NSArray *)xMarkTitlesAndValues titleKey:(NSString *)titleKey valueKey:(NSString *)valueKey {
    
    _xMarkTitlesAndValues = xMarkTitlesAndValues;
    
    xMarkTitles = [NSMutableArray array];
    valueArray = [NSMutableArray array];
    
    for (NSDictionary *dic in xMarkTitlesAndValues) {
        
        [xMarkTitles addObject:[dic objectForKey:titleKey]];
        if(![[dic objectForKey:valueKey] isEqualToString:@""]){
            //注意 此处 月份值为“” 说明month值已经大于当前月，无需在显示
            [valueArray addObject:[dic objectForKey:valueKey]];
        }
        NSLog(@"kk:%@",[dic objectForKey:valueKey]);
    }
    
}

#pragma mark 绘图
- (void)mapping {
    
    static CGFloat topToContainView = 0.f;
    
    if (self.title) {
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(18, 8, CGRectGetWidth(self.frame), 12)];
        self.titleLab.text = self.title;
        self.titleLab.font = [UIFont systemFontOfSize:12];
        self.titleLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.titleLab];
        topToContainView = 12;
    }
    
    if (!self.xMarkTitlesAndValues) {
        
        xMarkTitles = @[@1,@2,@3,@4,@5].mutableCopy;
        valueArray = @[@2,@2,@2,@2,@2].mutableCopy;
        
        NSLog(@"折线图需要一个显示X轴刻度标签的数组xMarkTitles");
        NSLog(@"折线图需要一个转折点值的数组valueArray");
    }

    
    if (!self.yMarkTitles) {
        self.yMarkTitles = @[@0,@1,@2,@3,@4,@5];
        NSLog(@"折线图需要一个显示Y轴刻度标签的数组yMarkTitles");
    }
    

    if (self.maxValue == 0) {
        self.maxValue = 5;
        NSLog(@"折线图需要一个最大值maxValue");
        
    }
        
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topToContainView, self.frame.size.width,self.frame.size.height - topToContainView)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self addSubview:self.scrollView];
    
    self.chartLineView = [[SJChartLineView alloc] initWithFrame:self.scrollView.bounds];
    if (self.title){
        self.chartLineView.isshowModdle = YES;
    }
    self.chartLineView.xcolor = _xcolor;
    self.chartLineView.yMarkTitles = self.yMarkTitles;
    self.chartLineView.xMarkTitles = xMarkTitles;
    self.chartLineView.xScaleMarkLEN = self.xScaleMarkLEN;
    self.chartLineView.valueArray = valueArray;
    self.chartLineView.maxValue = self.maxValue;
    
    [self.scrollView addSubview:self.chartLineView];
    
    [self.chartLineView mapping];
    
    self.scrollView.contentSize = self.chartLineView.bounds.size;
   
}

#pragma mark 更新数据
- (void)reloadDatas {
    [self.chartLineView reloadDatas];
}


@end
