//
//  Constants.h
//  Quartz
//
//  Created by SunGuozhi on 14-6-6.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#ifndef Quartz_Constants_h
#define Quartz_Constants_h

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

#endif
