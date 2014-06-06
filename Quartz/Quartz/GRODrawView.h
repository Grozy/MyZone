//
//  GRODrawView.h
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef Quartz_GRODrawView_h
#define Quartz_GRODrawView_h

typedef enum {
    kLineShape  =   0,
    kRectShape,
    kEllipseShape,
    kImageShape
}ShapeType;
typedef enum {
    kRedColorTab    =   0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
}ColorTabIndex;

#define degreesToRadian(x) (M_PI * (x) /180.f)

@interface GRODrawView : UIView
@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (nonatomic,retain) UIColor * currentColor;
@property (nonatomic) ShapeType shapeType;
@property (nonatomic,retain) UIImage * drawImage;
@property (nonatomic) BOOL useRandomColor;
@end



#endif