//
//  GROViewController.h
//  TouchExplorer
//
//  Created by SunGuozhi on 14-6-9.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GROViewController : UIViewController
@property (nonatomic,weak) IBOutlet UILabel * messageLabel;
@property (nonatomic,weak) IBOutlet UILabel * tapsLabel;
@property (nonatomic,weak) IBOutlet UILabel * touchesLabel;

- (void)updateLabelsFromTouches:(NSSet *)touches;
@end
