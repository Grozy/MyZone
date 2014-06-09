//
//  GRODrawView.m
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GRODrawView.h"
#import "UIColor+GRORandom.h"
@implementation GRODrawView
@synthesize currentColor = _currentColor;
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"github"];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGRect currentRect = CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y - _firstTouch.y);
    
    CGContextSetLineWidth(context, 2.f);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
//            CGContextStrokeRect(context,currentRect);
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y - _firstTouch.y));
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:{
            CGFloat horizontalOffset = _drawImage.size.width / 2;
            CGFloat verticalOffset = _drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x - horizontalOffset, _lastTouch.y -verticalOffset);
            [_drawImage drawAtPoint:drawPoint];
            }
            break;
        default:
            break;
    }
    /*
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
    
    CGContextRef rectRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(rectRef, 5.0);
    CGContextSetStrokeColorWithColor(rectRef, [UIColor greenColor].CGColor);
    CGContextAddRect(rectRef, CGRectMake(50, 50, 200, 200));
    CGContextSetFillColorWithColor(rectRef, [UIColor purpleColor].CGColor);

    CGContextStrokePath(rectRef);
     */
}

#pragma mark - Touch Handling
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_useRandomColor){
        self.currentColor = [UIColor randomColor];
    }
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    if (_shapeType == kImageShape) {
        CGFloat horizontalOffset = _drawImage.size.width / 2;
        CGFloat verticalOffset = _drawImage.size.height / 2;
        _redrawRect = CGRectUnion(_redrawRect, CGRectMake(_lastTouch.x - horizontalOffset, _lastTouch.y - verticalOffset, _drawImage.size.width, _drawImage.size.height));
    }else{
        _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    }
    _redrawRect = CGRectInset(_redrawRect, -2., -2.);
    [self setNeedsDisplayInRect:_redrawRect];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    if (_shapeType == kImageShape) {
        CGFloat horizontalOffset = _drawImage.size.width / 2;
        CGFloat verticalOffset = _drawImage.size.height / 2;
        _redrawRect = CGRectUnion(_redrawRect, CGRectMake(_lastTouch.x - horizontalOffset, _lastTouch.y - verticalOffset, _drawImage.size.width, _drawImage.size.height));
    }
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:_redrawRect];
}

#pragma mark - Get Rect -
- (CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y - _firstTouch.y);
}
@end
