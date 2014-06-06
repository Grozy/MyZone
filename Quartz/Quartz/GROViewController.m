//
//  GROViewController.m
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"

@interface GROViewController ()
@property (nonatomic,retain)     GRODrawView * myView;
@end

@implementation GROViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.myView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark addUI 
- (GRODrawView *)myView{
    if (!_myView) {
        _myView = [[GRODrawView alloc] initWithFrame:CGRectMake(10, 40, 300, 300)];
        _myView.backgroundColor = [UIColor lightGrayColor];
    }
    return _myView;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 4.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(context, 10., 10.);
    CGContextAddLineToPoint(context, 120.f, 120.f);
    CGContextStrokePath(context);
    
    
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context2, [UIColor blueColor].CGColor);
    
    CGPoint addLines[] =
    {
        CGPointMake(10.0, 90.0),
        CGPointMake(70.0, 60.0),
        CGPointMake(130.0, 90.0),
        CGPointMake(190.0, 60.0),
    };
    CGContextAddLines(context2, addLines, 5);
    
    CGContextStrokePath(context2);
    
  
    
    
}

@end
