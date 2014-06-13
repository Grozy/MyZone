//
//  GRORectButton.m
//  英语角详情
//
//  Created by SunGuozhi on 14-6-10.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GRORectButton.h"
#import "UIColor+iOS7Colors.h"
@interface GRORectButton()
@property (nonatomic) SEL sel;
@property (nonatomic) id target;
@property (nonatomic,retain) NSTimer * timer;
@property (assign) int time;
@end
@implementation GRORectButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.layer.cornerRadius = 13.f;
        self.backgroundColor = [UIColor iOS7hightlightBludColor];
        _time = 1;
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action{
    _target = target;
    _sel = action;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_target) {
        [_target performSelector:_sel withObject:Nil afterDelay:.2];
    }
    [_timer setFireDate:[NSDate distantFuture]];
    _timer = 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(longPressed) userInfo:nil repeats:YES];
    }else{
        [_timer setFireDate:[NSDate date]];
    }
}

- (BOOL)longPressed{
    if (_time > 2) {
        [_timer setFireDate:[NSDate distantFuture]];
        _time = 0;
        NSLog(@"Long Pressed");
    }
    NSLog(@"%d",_time);
    return _time =_time + 1;
}
///*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef drawRect = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(drawRect, 3, self.frame.size.height /2);
    CGContextAddLineToPoint(drawRect, self.frame.size.width -3 , self.frame.size.height /2);
    CGContextSetStrokeColorWithColor(drawRect, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(drawRect, 4);
    CGContextMoveToPoint(drawRect, self.frame.size.width /2, 3);
    CGContextAddLineToPoint(drawRect, self.frame.size.width / 2, self.frame.size.height - 3);
    
    CGContextStrokePath(drawRect);

    
    
}
//*/

@end
