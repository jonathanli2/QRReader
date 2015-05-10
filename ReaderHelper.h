//
//  ReaderHelper.h
//  QRQuickReader
//
//  Created by Li, Jonathan on 4/11/15.
//  Copyright (c) 2015 It21Learning. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "AVFoundation/AVFoundation.h"

@interface ReaderHelper : NSObject <AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) void(^completionBlock)(NSString*);

-(void)startRead:(UIView*)preview onCompletion:(void(^)(NSString*))complete;
-(void)playSound;
@end
