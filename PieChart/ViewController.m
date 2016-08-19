//
//  ViewController.m
//  PieChart
//
//  Created by 桑协东 on 16/8/15.
//  Copyright © 2016年 sangxiedong. All rights reserved.
//
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)

#import "ViewController.h"
#import "PNChart.h"

@interface ViewController ()

@property (nonatomic,strong)PNBarChart *barChart;
@property (nonatomic,strong)PNCircleChart *circleChart;
@property (nonatomic,strong)PNPieChart *pieChart;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 增加柱状图表
    [self addBarChart];
    
    // 增加环状图表
//    [self addCircleChart];
    
    // 增加饼状图表
//    [self addPieChart];
}

- (void)addBarChart {

    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter){
        barChartFormatter = [[NSNumberFormatter alloc] init];
        // 设置不同的数字格式
        barChartFormatter.numberStyle = NSNumberFormatterNoStyle;
        barChartFormatter.allowsFloats = NO;
        // 控制Y轴坐标的显示
        barChartFormatter.maximumFractionDigits = 0;
    }
    self.barChart = [[PNBarChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 150, 135, 300, 300)];
    self.barChart.backgroundColor = [UIColor clearColor];
    self.barChart.yLabelFormatter = ^(CGFloat yValue){
        return [barChartFormatter stringFromNumber:[NSNumber numberWithFloat:yValue]];
    };
    self.barChart.yChartLabelWidth = 20.0; // Y坐标label宽度
    // Y坐标距离坐标轴的距离
    self.barChart.chartMarginLeft = 30.0;
    self.barChart.chartMarginRight = 10.0;
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    
    
    self.barChart.labelMarginTop = 10.0; // X坐标刻度的上边距
    self.barChart.showChartBorder = YES; // 坐标轴
    [self.barChart setXLabels:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
    [self.barChart setYValues:@[@10.82,@1.88,@6.96,@33.93,@10.82,@1.88,@6.96,@33.93]];
    
    [self.barChart setStrokeColors:@[PNGreen,PNGreen,PNRed,PNGreen,PNGreen,PNGreen,PNRed,PNGreen]];
    self.barChart.isGradientShow = YES; // 立体效果
    self.barChart.isShowNumbers = NO; // 显示各条状图的数值
    
    [self.barChart strokeChart];
    
//    self.barChart.delegate = self;
    
    [self.view addSubview:self.barChart];
    
}

- (void)addCircleChart {
    self.circleChart = [[PNCircleChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, 135, 200, 200) total:@100 current:@70 clockwise:YES];
    
    self.circleChart.backgroundColor = [UIColor clearColor];    
    [self.circleChart setStrokeColor:[UIColor clearColor]];
    // 设置环的背景色
    [self.circleChart setStrokeColorGradientStart:[UIColor greenColor]];
    // 添加环
    [self.circleChart strokeChart];
    [self.view addSubview:self.circleChart];
    
}

- (void)addPieChart {
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10.0 color:[UIColor redColor]],[PNPieChartDataItem dataItemWithValue:30.0 color:[UIColor greenColor] description:@"sex"],[PNPieChartDataItem dataItemWithValue:50.0 color:[UIColor blueColor] description:@"age"],[PNPieChartDataItem dataItemWithValue:10.0 color:[UIColor orangeColor] description:@"money"]];
    self.pieChart = [[PNPieChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, 135, 200, 200) items:items];
    self.pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor]; // 阴影颜色
    self.pieChart.showAbsoluteValues = NO; // 显示实际数值(不显示比例数字)
    self.pieChart.showOnlyValues = YES; // 只显示数值不显示内容描述
    [self.view addSubview:self.pieChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
