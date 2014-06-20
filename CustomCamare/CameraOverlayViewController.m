//
//  CameraOverlayViewController.m
//  CustomCamera
//
//  Created by SunGuozhi on 14-6-19.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "CameraOverlayViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "GROBackGroundView.h"
@interface CameraOverlayViewController (){
    BOOL isOneToOne;
    NSMutableArray * imageArray;
//    ShadowView * shadowView;
}

//@property (nonatomic,retain) UIButton * cameraScaleBtn;
//@property (nonatomic,retain) UIImageView * titleImageView;
//@property (nonatomic,retain) UIButton * flashModeBtn;
//@property (nonatomic,retain) UIButton * photoBtn;
//@property (nonatomic,retain) UIButton * deviceModeBtn;

@end

@implementation CameraOverlayViewController



@synthesize imagePickerController = _imagePickerController;
//@synthesize cameraScaleBtn;
//@synthesize titleImageView;
//@synthesize flashModeBtn;
//@synthesize deviceModeBtn;
//@synthesize photoBtn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.view.frame = CGRectMake(0, 100, 100, 100);
        self.imagePickerController.navigationController.view.frame = CGRectMake(0, 100, 100, 100);
        self.imagePickerController.delegate = self;

//        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.imagePickerController.allowsEditing = YES;
        self.imagePickerController.view.frame = CGRectMake(0, 0, 320, 568);
//        self.imagePickerController->_cropRect = CGRectMake(0, 0, 320, 568);
        NSLog(@"%@",self.imagePickerController);
//        CGAffineTransform CGAffineTransformMakeTranslation (CGFloat tx,CGFloat ty);
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(0.f, 100.0f);
//        self.imagePickerController.cameraViewTransform = CGAffineTransformScale(_im .cameraViewTransform, CAMERA_SCALAR, CAMERA_SCALAR);;

//        imagePickerController.showsCameraControls = NO;
//        [self.imagePickerController setShowsCameraControls:NO];
//        imagePickerController.wantsFullScreenLayout = YES;
//        [self.imagePickerController setWantsFullScreenLayout:YES];
//        imagePickerController.navigationBarHidden = YES;
//        imagePickerController.toolbarHidden = YES;
//        self.view.frame = CGRectMake(0, 0, 320, 568);

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    isOneToOne = YES;
    imageArray = [[NSMutableArray alloc]init];
//    shadowView = [[ShadowView alloc]initWithRect:CGRectMake(0, 80, 320, 320)];
//    [self.view addSubview:shadowView];
//    [self.view sendSubviewToBack:shadowView];
//    [shadowView release];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//闪光灯
-(IBAction)cameraTorchOn:(id)sender{
    if (self.imagePickerController.cameraFlashMode ==UIImagePickerControllerCameraFlashModeAuto) {
        self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
    }else {
        self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
    }
}


//前后摄像头
- (IBAction)swapFrontAndBackCameras:(id)sender {
    if (self.imagePickerController.cameraDevice ==UIImagePickerControllerCameraDeviceRear ) {
        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }else {
        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
}
//改变拍摄比例
-(IBAction)changeCameraScale:(id)sender{
    if (isOneToOne) {
//        [shadowView changeRect:CGRectMake(0, 0, 320, 428)];
//        [cameraScaleBtn setImage:[UIImage imageNamed:@"font_-scale43.png"] forState:UIControlStateNormal];
//        titleImageView.alpha = 0.2;
//        flashModeBtn.alpha = 0.5;
//        deviceModeBtn.alpha = 0.5;
//        isOneToOne = NO;
//    }else {
////        [shadowView changeRect:CGRectMake(0, 80, 320, 320)];
//        [cameraScaleBtn setImage:[UIImage imageNamed:@"font_-scale11.png"] forState:UIControlStateNormal];
//        titleImageView.alpha = 1;
//        flashModeBtn.alpha = 1;
//        deviceModeBtn.alpha = 1;
//        isOneToOne = YES;
    }
}


- (IBAction)enterPhotoAlbum:(id)sender {
//    PhotoAlbumViewController* photoAlbumViewController = [[PhotoAlbumViewController alloc]initWithNibName:@"PhotoAlbumViewController" bundle:nil];
//    [self presentModalViewController:photoAlbumViewController animated:YES];
    
}


//拍摄照片
-(IBAction)takeThePic:(id)sender{
    [self.imagePickerController takePicture];
}


-(IBAction)backToHome:(id)sender{
//    [pickerController dismissModalViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backToHome" object:nil];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc
{
//    [cameraScaleBtn release];
//    [flashModeBtn release];
//    [deviceModeBtn release];
//    [titleImageView release];
//    [super dealloc];
}


-(void)getAllPhotoImages{
    ALAssetsLibraryAccessFailureBlock failureblock = ^(NSError *myerror){
        
        NSLog(@"error occour =%@", [myerror localizedDescription]);
    };
    ALAssetsGroupEnumerationResultsBlock groupEnumerAtion = ^(ALAsset *result, NSUInteger index, BOOL *stop){
        if (result!=NULL) {
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [imageArray addObject:result];
                UIImage *img=[UIImage imageWithCGImage:result.thumbnail];
//                [photoBtn setImage:img forState:UIControlStateNormal];
            }
        }
    };
    ALAssetsLibraryGroupsEnumerationResultsBlock
    
    libraryGroupsEnumeration = ^(ALAssetsGroup* group, BOOL* stop){
        
        if (group == nil) {
            return;
        }
        if (group!=nil) {
            [group enumerateAssetsUsingBlock:groupEnumerAtion];
        }
    };
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
     
                           usingBlock:libraryGroupsEnumeration
     
                         failureBlock:failureblock];
//    [library release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    // give the taken picture to our delegate
    if (self.delegate)
        [self.delegate didTakePicture:image];
    
    
    
    [self finishAndUpdate];
}

- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    self.imagePickerController.sourceType = sourceType;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        // user wants to use the camera interface
        //
        self.imagePickerController.showsCameraControls = NO;
        
        if ([[self.imagePickerController.cameraOverlayView subviews] count] == 0)
        {
            // setup our custom overlay view for the camera
            //
            // ensure that our custom view's frame fits within the parent frame
            CGRect overlayViewFrame = self.imagePickerController.cameraOverlayView.frame;
            CGRect newFrame = CGRectMake(0.0,
                                         CGRectGetHeight(overlayViewFrame) -
                                         self.view.frame.size.height - 10.0,
                                         CGRectGetWidth(overlayViewFrame),
                                         self.view.frame.size.height + 10.0);
            self.view.frame = newFrame;
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(110, 480, 100, 100);
            [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
            [button setBackgroundImage:[UIImage imageNamed:@"takePic"] forState:UIControlStateNormal];
            
            _turnCamera = [UIButton buttonWithType:UIButtonTypeCustom];
            [_turnCamera setBackgroundImage:[UIImage imageNamed:@"turnCamera.png"] forState:UIControlStateNormal];
            _turnCamera.frame = CGRectMake(240, 5, 60, 60);
            [_turnCamera addTarget:self action:@selector(changeCamera) forControlEvents:UIControlEventTouchUpInside];
            UIButton * flushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [flushBtn setBackgroundImage:[UIImage imageNamed:@"on_flash.png"] forState:UIControlStateNormal];
            flushBtn.frame = CGRectMake(10, 5, 60, 60);
            
            GROBackGroundView * bottomView = [[GROBackGroundView alloc] initWithFrame:CGRectMake(0, 485, 320, 100)];
            GROBackGroundView * topView = [[GROBackGroundView alloc] initWithFrame:CGRectMake(0, 0, 320, 65)];
            
            [self.view addSubview:topView];
            [self.view addSubview:bottomView];
            [self.view addSubview:flushBtn];
            [self.view addSubview:_turnCamera];
            [self.view addSubview:button];
            self.imagePickerController.cameraOverlayView.backgroundColor = [UIColor clearColor];
            NSLog(@"%@,%@",self.imagePickerController.cameraOverlayView.subviews,self.imagePickerController.view.subviews);
            [self.imagePickerController.view setUserInteractionEnabled:YES];
            
            [self.imagePickerController setNavigationBarHidden:YES];
            [self.imagePickerController setCameraFlashMode:UIImagePickerControllerCameraFlashModeOn];
            self.imagePickerController.view.frame = CGRectMake(0, 0, 320, 568);
            [self.imagePickerController setCameraViewTransform:CGAffineTransformMakeTranslation(0, 50)];
//            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//            [self preferredStatusBarStyle];
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
            
            
            
            [self.imagePickerController.cameraOverlayView addSubview:self.view];
            [self.imagePickerController setNavigationBarHidden:YES];
        }
    }
}



- (void)changeCamera{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:.8];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_turnCamera cache:YES];
    
    if (self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }else
        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    [UIView commitAnimations];
}

- (void)buttonClicked{
    [self.imagePickerController takePicture];
}

- (void)finishAndUpdate
{
    [self.delegate didFinishWithCamera];  // tell our delegate we are done with the camera
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.delegate didFinishWithCamera];    // tell our delegate we are finished with the picker
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return NO;
}

@end

