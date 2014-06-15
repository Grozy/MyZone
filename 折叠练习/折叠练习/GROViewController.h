//
//  GROViewController.h
//  折叠练习
//
//  Created by SunGuozhi on 14-6-15.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GROViewController : UIViewController
{
    NSMutableArray * _array;//每组的数据
    BOOL _isShow;//组的状态,yes显示组，no不显示组
    NSString * _name;//组名
}
@property (nonatomic,retain) NSMutableArray * array;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) BOOL isShow;
@end
