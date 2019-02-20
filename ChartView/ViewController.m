//
//  ViewController.m
//  ChartView
//
//  Created by Khada Jhin on 2018/8/13.
//  Copyright © 2018年 Khada Jhin. All rights reserved.
//

#import "ViewController.h"
#import "SJLineChart.h"
#import "PieChartView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor blackColor];
    
    // 初始化折线图
    SJLineChart *lineChart = [[SJLineChart alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 280)];
    lineChart.backgroundColor = [UIColor whiteColor];
    lineChart.xcolor = [UIColor blueColor];
    lineChart.maxValue = 100;   // 最大值
    lineChart.yMarkTitles = @[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100"]; // Y轴刻度标签
    NSArray *array =  @[@{@"month":@"1",@"total":@"40"},@{@"month":@"2",@"total":@"5"},@{@"month":@"3",@"total":@"69"},@{@"month":@"4",@"total":@"12"},@{@"month":@"5",@"total":@"45"},@{@"month":@"6",@"total":@"23"},@{@"month":@"7",@"total":@"80"},@{@"month":@"8",@"total":@"92"},@{@"month":@"9",@"total":@"12"},@{@"month":@"10",@"total":@"12"},@{@"month":@"11",@"total":@"9"},@{@"month":@"12",@"total":@"71"}];
    
    [lineChart setXMarkTitlesAndValues:array titleKey:@"month" valueKey:@"total"];
    [lineChart mapping];
    [self.view addSubview:lineChart];
    
    //初始化饼状视图
    PieChartView *pieV = [[PieChartView alloc] initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width - 40, self.view.bounds.size.width - 40) withValue:@[@"100",@"300"].mutableCopy withColor:@[[UIColor yellowColor],[UIColor redColor]].mutableCopy];
    [self.view addSubview:pieV];
    [pieV reloadChart];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
