//
//  GROBackGroundView.m
//  CustomCamera
//
//  Created by SunGuozhi on 14-6-20.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROBackGroundView.h"

@implementation GROBackGroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

///*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
#define CGColor(r,g,b) (CGFloat[]){(r)/255.f, (g)/255.f, (b)/255.f, 1.0f}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //创建Quartz对象的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建彩色空间对象
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    //创建起点颜色
//    34/ 43 44
    CGColorRef beginColor = CGColorCreate(colorSpaceRef,CGColor(15,131,255));
//                                          (CGFloat[]){0.01f, 0.99f, 0.01f, 1.0f});
    // 创建终点颜色
    CGColorRef endColor = CGColorCreate(colorSpaceRef, CGColor(134,144,254));
    // 创建颜色数组
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
    
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,       // 对应起点颜色位置
        .999f        // 对应终点颜色位置
    });
    
    // 释放颜色数组
    CFRelease(colorArray);
    
    // 释放起点和终点颜色
    CGColorRelease(beginColor);
    CGColorRelease(endColor);
    
    // 释放色彩空间
    CGColorSpaceRelease(colorSpaceRef);
    
    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0.0f, 100.0f), CGPointMake(450.0f, -100.0f), 0);
    
    // 释放渐变对象
    CGGradientRelease(gradientRef);
}
//*/

@end
