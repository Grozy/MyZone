//
//  GROLineChart.h
//  LineChart
//
//  Created by SunGuozhi on 14-6-11.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef struct XCoordinate{
    float x;
    float y;
    float x_incrementalLevel;
    float y_incrementalLevel;
    int x_seciton;
    int y_seciton;
    float x_Max;
    float y_Max;
}Coor;
@interface GROLineChart : UIView{
    Coor coor;

}
@property (assign) CGFloat max_X;
@property (assign) CGFloat min_X;
@property (assign) CGFloat min_Y;
@property (assign) CGFloat max_Y;
@property (assign) CGFloat incrementalLevel;
@property (assign) NSInteger seciton;
@property (assign) Coor coor;
- (id)initWithFrame:(CGRect)frame coor:(Coor)coor;
@end
