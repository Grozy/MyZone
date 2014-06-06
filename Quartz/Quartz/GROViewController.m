//
//  GROViewController.m
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"
#import "UIColor+GRORandom.h"
@interface GROViewController ()
@property (nonatomic,retain)     GRODrawView * myView;
@end

@implementation GROViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark addUI 
- (IBAction)changeShape:(id)sender {
    UISegmentedControl * control = sender;
    [(GRODrawView *)self.view  setShapeType:[control selectedSegmentIndex]];
    if ([control selectedSegmentIndex] == kImageShape) {
        _colorControl.hidden = YES;
    }else{
        _colorControl.hidden = NO;
    }
}

- (IBAction)changeColor:(id)sender {
    UISegmentedControl * control = sender;
    NSInteger index = [control selectedSegmentIndex];
    GRODrawView * drawView = (GRODrawView *)self.view;
    switch (index) {
        case kRedColorTab:
            drawView.currentColor = [UIColor redColor];
            drawView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            drawView.currentColor = [UIColor blueColor];
            drawView.useRandomColor = NO;
            break;
            
        case kYellowColorTab:
            drawView.currentColor = [UIColor yellowColor];
            drawView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            drawView.currentColor = [UIColor greenColor];
            drawView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            drawView.currentColor = [UIColor randomColor];
            drawView.useRandomColor = YES;
            break;
        default:
            break;
    }
}
@end
