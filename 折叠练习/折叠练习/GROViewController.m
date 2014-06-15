//
//  GROViewController.m
//  折叠练习
//
//  Created by SunGuozhi on 14-6-15.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"

@interface GROViewController ()
@property (nonatomic,retain) UIImageView * _imageView;
@end

@implementation GROViewController
@synthesize _imageView = __imageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //全局的数据源
    __imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, self.view.frame.size.width, self.view.frame.size.height)];
//    __imageView.image = [self scaleImage:[UIImage imageNamed:@"Girl.png"] toScale:3];;
    [self.view addSubview:__imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage * scaleImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    return scaleImage;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    float offset =  touchPoint.x - __imageView.frame.origin.x;
    float scale =  offset / __imageView.frame.size.width;
    __imageView.image = [self scaleImage:[UIImage imageNamed:@"Girl.png"] toScale:1/scale];
    [__imageView setNeedsDisplay];
}
@end
