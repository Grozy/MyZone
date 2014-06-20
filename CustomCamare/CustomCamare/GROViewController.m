//
//  GROViewController.m
//  CustomCamare
//
//  Created by SunGuozhi on 14-6-19.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"
#import "CameraOverlayViewController.h"
#import "GROBackGroundView.h"
#import <GameKit/GameKit.h>
@interface GROViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,CameraOverlayViewControllerDelegate,GKPeerPickerControllerDelegate,GKSessionDelegate,UITextFieldDelegate>
@property (nonatomic,retain) UIView * plcameraview;
@property (nonatomic,retain) CameraOverlayViewController * overlayViewController;
@end

@implementation GROViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    int a = 4|3;
//    c = a|b;
    NSLog(@"%d",a);
    GROBackGroundView * bg = [[GROBackGroundView alloc] initWithFrame:self.view.frame];
    
    UIButton * openCamera = [UIButton buttonWithType:UIButtonTypeCustom];
    openCamera.frame = CGRectMake(10, 450, 300, 45);
    [openCamera setTitle:@"open camera" forState:UIControlStateNormal];
    [openCamera setBackgroundColor:[UIColor redColor]];
    [openCamera addTarget:self action:@selector(sendDataToPeer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bg];
    
    
    UIImageView * switchButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 34, 40, 40)];
    UISwitch * swithc1 = [[UISwitch alloc] init];
    switchButton.image = swithc1.onImage;
    
    UIButton * openGameKit = [UIButton buttonWithType:UIButtonTypeCustom];
    openGameKit.frame = CGRectMake(10, 400, 300, 45);
    [openGameKit setBackgroundColor:[UIColor yellowColor]];
    [openGameKit setTitle:@"open GameKit" forState:UIControlStateNormal];
    [openGameKit addTarget:self action:@selector(openGameKit:) forControlEvents:UIControlEventTouchUpInside];
    _textfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 490, 300, 45)];
    _textfield.delegate = self;
    [self.view addSubview:_textfield];
    [self.view addSubview:openGameKit];
    [self.view addSubview:switchButton];
    
    [self.view addSubview:openCamera];
    
    
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)sendDataToPeer{
    [self sendDataToPeers:[[NSData alloc] initWithBase64Encoding:_textfield.text]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)openGameKit:(id)sender{
    GKPeerPickerController * picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [picker show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

-(UIView *)findView:(UIView *)aView withName:(NSString *)name{
    Class cl = [aView class];
    NSString *desc = [cl description];
    
    if ([name isEqualToString:desc])
        return aView;
    
    for (NSUInteger i = 0; i < [aView.subviews count]; i++)
    {
        UIView *subView = [aView.subviews objectAtIndex:i];
        subView = [self findView:subView withName:name];
        if (subView)
            return subView;
    }
    return nil;
}
-(void)addSomeElements:(UIViewController *)viewController{
    
    
    UIView *PLCameraView=[self findView:viewController.view withName:@"PLCameraView"];
    
    UIView *bottomBar=[self findView:PLCameraView withName:@"PLCropOverlayBottomBar"];
    
    UIImageView *bottomBarImageForSave = [bottomBar.subviews objectAtIndex:0];
    NSLog(@"%@",bottomBarImageForSave.subviews);
    UIButton *retakeButton=[bottomBarImageForSave.subviews objectAtIndex:0];
    [retakeButton setTitle:@"重拍" forState:UIControlStateNormal];  //左下角按钮
    UIButton *useButton=[bottomBarImageForSave.subviews objectAtIndex:1];
    [useButton setHidden:NO];
    [useButton setTitle:@"上传" forState:UIControlStateNormal];  //右下角按钮
    UIButton *useButton2=[bottomBarImageForSave.subviews objectAtIndex:2];
    [useButton2 setTitle:@"上传" forState:UIControlStateNormal];
    UIImageView * block = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    block.image = [UIImage imageNamed:@"1.jpg"];
    block.layer.cornerRadius = 50;
    [block.layer setMasksToBounds:YES];
    [PLCameraView addSubview:block];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [self addSomeElements:viewController];
}

- (void)didTakePicture:(UIImage *)picture
{
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.capturedImage = picture;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 300, 400)];
    imageView.image = self.capturedImage;
    [self.view addSubview:imageView];
}

- (void)didFinishWithCamera
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)openCamera:(id)sender{
    self.overlayViewController =
    [[CameraOverlayViewController alloc] init];
    self.overlayViewController.delegate = self;
    [self.overlayViewController setupImagePicker:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:self.overlayViewController.imagePickerController animated:YES completion:nil];
}

- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type{
    if (!self.session) {
        self.session = [[GKSession alloc] initWithSessionID:(self.sessionId ? self.sessionId : @"Sample session") displayName:Nil sessionMode:GKSessionModePeer];
        self.session.delegate = self;
    }
    return self.session;
}

- (void)sendDataToPeers:(NSData *)data{
    NSError * error;
    BOOL didSend = [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:&error];
    if (!didSend) {
        NSLog(@"Error sending data to peers:%@",[error localizedDescription]);
    }
}


@end
