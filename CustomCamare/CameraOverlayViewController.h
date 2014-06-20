//
//  CameraOverlayViewController.h
//  CustomCamera
//
//  Created by SunGuozhi on 14-6-19.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CameraOverlayViewControllerDelegate;

@interface CameraOverlayViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,retain) id <CameraOverlayViewControllerDelegate> delegate;
@property (nonatomic,retain) UIImagePickerController * imagePickerController;
@property (nonatomic,retain) UIButton * turnCamera;
- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;
@end


@protocol CameraOverlayViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
@end