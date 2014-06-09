//
//  GRODrawView.h
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface GRODrawView : UIView//<NSCoding>
@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (nonatomic,retain) UIColor * currentColor;
@property (nonatomic) ShapeType shapeType;
@property (nonatomic,retain) UIImage * drawImage;
@property (nonatomic) BOOL useRandomColor;
@property (readonly) CGRect currentRect;
@property CGRect redrawRect;
@end
