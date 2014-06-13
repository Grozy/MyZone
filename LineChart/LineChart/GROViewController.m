//
//  GROViewController.m
//  LineChart
//
//  Created by SunGuozhi on 14-6-11.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"
#import "GROLineChart.h"
#import "UIColor+iOS7Colors.h"

@interface GROViewController ()
@property (nonatomic,retain) GROLineChart * lineChart;
@end

@implementation GROViewController
#define KLineChatViewHeight self.view.frame.size.height/2 - 40
#define KLineChatViewWidth self.view.frame.size.width - 80
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.lineChart];
    [self.lineChart setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (GROLineChart *)lineChart{
    if (!_lineChart) {
        Coor coor;
        coor.x = 150.f;
        coor.y = 150.f;
        coor.y_incrementalLevel = 2.f;
        coor.x_Max = 20;
        coor.x_incrementalLevel = 3.f;
        coor.y_Max = 20;
        _lineChart = [[GROLineChart alloc] initWithFrame:CGRectMake(40, 40, KLineChatViewWidth, KLineChatViewHeight) coor:coor];
        _lineChart.backgroundColor = [UIColor iOS7pinkColor];
        _lineChart.min_X = -100.f;
        _lineChart.max_Y = 100.f;
        _lineChart.min_Y = -100.f;
        _lineChart.max_X = 100.f;
        
        NSLog(@"\nKLineChatViewWidth:%.2f\nKLineChatViewHeight:%.2f",KLineChatViewWidth,KLineChatViewHeight);
    }
    return _lineChart;
}

@end
