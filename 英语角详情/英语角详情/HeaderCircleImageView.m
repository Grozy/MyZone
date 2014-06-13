//
//  HeaderCircleImageView.m
//  英语角详情
//
//  Created by SunGuozhi on 14-6-10.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "HeaderCircleImageView.h"
@interface HeaderCircleImageView()
@property (nonatomic) SEL action;
@property (nonatomic,retain) id target;
@end
@implementation HeaderCircleImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = frame.size.height/2;
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action{
    _target = target;
    _action = action;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_target) {
        [_target performSelector:_action withObject:self afterDelay:0.2f];
    }
}

@end
