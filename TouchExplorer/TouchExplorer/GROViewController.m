//
//  GROViewController.m
//  TouchExplorer
//
//  Created by SunGuozhi on 14-6-9.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"
#import "GROSwipesViewController.h"
@interface GROViewController ()

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

- (void)updateLabelsFromTouches:(NSSet *)touches{
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString * tapsMessage = [[NSString alloc] initWithFormat:@"%lu taps detected",(unsigned long)numTaps];
    self.tapsLabel.text = tapsMessage;
    NSUInteger numTouches = [touches count];
    NSString * touchMsg = [[NSString alloc] initWithFormat:@"%lu touches detected",(unsigned long)numTouches];
    self.touchesLabel.text = touchMsg;
}

#pragma mark - Touch Event Methods -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.messageLabel.text = @"Touches Began";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.messageLabel.text = @"Touches Move";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.messageLabel.text = @"Touches End";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.messageLabel.text = @"Touches Cancelled";
    [self updateLabelsFromTouches:touches];
}

- (IBAction)gotoNextPage:(id)sender {
    [self performSegueWithIdentifier:@"swipe" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

@end
