//
//  GROViewController.h
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRODrawView.h"
@interface GROViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;
- (IBAction)changeColor:(id)sender;

@end
