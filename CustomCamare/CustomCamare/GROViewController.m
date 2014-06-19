//
//  GROViewController.m
//  CustomCamare
//
//  Created by SunGuozhi on 14-6-19.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"

@interface GROViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,retain) UIView * plcameraview;
@end

@implementation GROViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * openCamera = [UIButton buttonWithType:UIButtonTypeCustom];
    openCamera.frame = CGRectMake(10, 200, 300, 45);
    [openCamera setTitle:@"open camera" forState:UIControlStateNormal];
    [openCamera setBackgroundColor:[UIColor redColor]];
    [openCamera addTarget:self action:@selector(openCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openCamera];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (void)openCamera:(id)sender{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController * _picker = [[UIImagePickerController alloc] init];
    _picker.delegate  = self;
    _picker.allowsEditing  =  YES;//设置可编辑
    _picker.sourceType = sourceType;
    [self presentViewController:_picker animated:YES completion:nil];//
    [self setup:_picker.view];
//    [_picker release];

}

- (void) setup: (UIView *) aView
{
    //获取相机界面的view
    self.plcameraview = [self subviewWithClass:aView withClass:NSClassFromString(@"PLCameraView")];
    if (!_plcameraview) return;
    
    //相机原有控件全部透明
    NSArray *svarray = [_plcameraview subviews];
    for (int i = 1; i < svarray.count; i++)  [[svarray objectAtIndex:i] setAlpha:0.0f];
    
    //加入自己的UI界面
#if 1
//    self.navbar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)] autorelease];
//    UINavigationItem *navItem = [[[UINavigationItem alloc] init] ;
//    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Shoot" style:UIButtonTypeCustom target:self action:@selector(dissmiss:)];
////    BARBUTTON(@"Shoot", @selector(shoot:));
//    navItem.leftBarButtonItem = BARBUTTON(@"Cancel", @selector(dismiss:));
////
//    [(UINavigationBar *)self.navbar pushNavigationItem:navItem animated:NO];
//    [_plcameraview addSubview:self.navbar];
#endif
}

- (UIView *)subviewWithClass:(UIView *)aView withClass:(Class)cl {
//	Class cl = [aView class];
//	NSString *desc = [cl description];
	
//	if ([name isEqualToString:desc])
//		return aView;
	
	for (NSUInteger i = 0; i < [aView.subviews count]; i++) {
		UIView *subView = [aView.subviews objectAtIndex:i];
		subView = [self subviewWithClass:subView withClass:cl];//:subView withName:name];
		if (subView)
			return subView;
	}
	return nil;
}

//启动相机
- (void) getStarted: (id) sender
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType =  UIImagePickerControllerSourceTypeCamera;
//    [self presentModalViewController:ipc animated:YES];
    [self performSelector:@selector(setup:) withObject:ipc.view afterDelay:0.5f];
}
@end
