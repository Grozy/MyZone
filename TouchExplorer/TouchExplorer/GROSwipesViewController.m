//
//  GROSwipesViewController.m
//  TouchExplorer
//
//  Created by SunGuozhi on 14-6-9.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROSwipesViewController.h"

@interface GROSwipesViewController ()

@end

@implementation GROSwipesViewController
#define kMininumGestureLength   25
#define kMaximumVariance        5
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UISwipeGestureRecognizer * vertrical = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportVerticalSwipe:)];
    UISwipeGestureRecognizer * horizontal = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportHorizontalSwipe:)];
    vertrical.direction = UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:vertrical];
    
    horizontal.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:horizontal];
}

- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer{
    self.label.text = @"Vertical swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognize{
    self.label.text = @"Horizontal swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)eraseText{
    self.label.text = @"";
}



//#pragma mark -
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch * touch = [touches anyObject];
//    self.gestureStartPoint = [touch locationInView:self.view];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch * touch = [touches anyObject];
//    CGPoint currentPosistion = [touch locationInView:self.view];
//    CGFloat deltaX = fabsf(self.gestureStartPoint.x - currentPosistion.x);
//    CGFloat deltaY = fabsf(self.gestureStartPoint.y - currentPosistion.y);
//    if (deltaX >= kMininumGestureLength && deltaY < kMaximumVariance) {
//        self.label.text = @"Vertical swipe detected";
//        [self performSelector:@selector(eraseText) withObject:self afterDelay:2];
//    }else if(deltaY >= kMininumGestureLength && deltaX <= kMaximumVariance){
//        self.label.text = @"Vertical";
//        [self performSelector:@selector(eraseText) withObject:nil afterDelay:20];
//    }
//}
//

@end
