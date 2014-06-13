//
//  GROLineChart.m
//  LineChart
//
//  Created by SunGuozhi on 14-6-11.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROLineChart.h"

@implementation GROLineChart
#define KLineChatViewHeight self.frame.size.height
#define KLineChatViewWidth self.frame.size.width
#define kOffsetOfVertical   self.frame.size.width/20
#define kOffsetOfHorizon    self.frame.size.height/20
@synthesize coor = _coor;
- (id)initWithFrame:(CGRect)frame coor:(Coor)mycoor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _coor = mycoor;
        _coor.x_seciton = _coor.x_Max / _coor.x_incrementalLevel;
        _coor.y_seciton = _coor.y_Max / _coor.y_incrementalLevel;
        _coor.x = fabs(mycoor.x) + kOffsetOfHorizon;
        _coor.y = fabs(mycoor.y) + kOffsetOfVertical;
        
    }
    return self;
}


///*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    // Drawing code
    [self clearsContextBeforeDrawing];

    [self drawCoordinateSystem];
    
    
}

- (void)drawCoordinateSystem{
    CGContextRef drawCoordinate = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(drawCoordinate, 1.f);
    CGContextSetStrokeColorWithColor(drawCoordinate, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(drawCoordinate, kOffsetOfVertical , _coor.y);
    CGContextAddLineToPoint(drawCoordinate, KLineChatViewWidth - kOffsetOfVertical , _coor.y);
    CGContextMoveToPoint(drawCoordinate, _coor.x, kOffsetOfVertical);
    CGContextAddLineToPoint(drawCoordinate, _coor.x, KLineChatViewHeight - kOffsetOfVertical);
    CGContextSetTextPosition(drawCoordinate, _coor.x, _coor.y);
    //设置画笔线条粗细
    CGContextSetLineWidth(drawCoordinate, 2.0);
    //设置矩形填充颜色：红色
    CGContextSetRGBFillColor (drawCoordinate, 1.0, 1.0, 1.0, 1.0);
    //设置字体
    UIFont *font = [UIFont boldSystemFontOfSize:14.0];
    //在指定的矩形区域内画文字
    NSString * text = @"0";
    [text drawInRect:CGRectMake(_coor.x +2, _coor.y, 100, 30) withFont:font];
        CGContextStrokePath(drawCoordinate);
    [self clearsContextBeforeDrawing];
    CGContextSetLineWidth(drawCoordinate, .5);
    for (int i = - _coor.x_seciton; i <= _coor.x_seciton; i++) {
        [self clearsContextBeforeDrawing];
            NSString * num = @(i * _coor.x_incrementalLevel).stringValue;
        [num drawInRect:CGRectMake(i * ((KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.x_seciton) + _coor.x + 2, _coor.y, 100, 30) withFont:font];
        CGContextMoveToPoint(drawCoordinate,_coor.x + i * (KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.x_seciton, kOffsetOfVertical);
        CGContextAddLineToPoint(drawCoordinate,_coor.x + i * (KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.x_seciton, KLineChatViewHeight - kOffsetOfVertical);
            CGContextStrokePath(drawCoordinate);
    }
    for (int i = - _coor.y_seciton; i <= _coor.y_seciton; i++) {
        [self clearsContextBeforeDrawing];
        NSString * num = @(i * _coor.y_incrementalLevel).stringValue;
        [num drawInRect:CGRectMake( _coor.x + 2, - i * ((KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.y_seciton) + _coor.y, 100, 30) withFont:font];
        
        CGContextMoveToPoint(drawCoordinate, kOffsetOfHorizon,_coor.y + i * (KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.y_seciton);
        CGContextAddLineToPoint(drawCoordinate,KLineChatViewWidth -  kOffsetOfHorizon,_coor.y + i * (KLineChatViewHeight - 2 * kOffsetOfHorizon) / _coor.y_seciton);
        CGContextStrokePath(drawCoordinate);
    }

    
    
    
    
    

}
//*/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _coor.x = [touch locationInView:self].x;
    _coor.y = [touch locationInView:self].y;
    [self setNeedsDisplay];
}

@end
