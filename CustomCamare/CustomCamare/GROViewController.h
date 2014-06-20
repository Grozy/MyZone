//
//  GROViewController.h
//  CustomCamare
//
//  Created by SunGuozhi on 14-6-19.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GKSession;
@interface GROViewController : UIViewController
@property (nonatomic,retain) UIImage * capturedImage;
@property (nonatomic,retain) GKSession * session;
@property (nonatomic,copy) NSString * sessionId;
@property (nonatomic,retain) UITextField * textfield;
@end
