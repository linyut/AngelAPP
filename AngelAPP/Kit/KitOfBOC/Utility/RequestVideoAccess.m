//
//  RequestVideoAccess.m
//  PBPS-MA
//
//  Created by mark on 2017/10/26.
//  Copyright © 2017年 BOC_PBPS. All rights reserved.
//

#import "RequestVideoAccess.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation RequestVideoAccess

+ (void)checkAccessVideoAfterAction:(void(^)(ECheckResult CheckStatus))afterAction {
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (authStatus) {
            case AVAuthorizationStatusAuthorized:
                if (afterAction) afterAction(StatusAuthorized);
                break;
            case AVAuthorizationStatusRestricted:
                if (afterAction) afterAction(StatusRestricted);
                break;
            case AVAuthorizationStatusDenied:
                if (afterAction) afterAction(StatusDenied);
                break;
            case AVAuthorizationStatusNotDetermined:
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_async_on_main_queue(^{
                            if (afterAction) afterAction(StatusAuthorized);
                        });
                    }
                }];
                break;
        }
    }
    else{
        if (afterAction) afterAction(NotSupport);
    }
}

+ (void)checkAccessPhotoLibraryAfterAction:(void(^)(ECheckResult CheckStatus))afterAction {
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] ) {
        
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        switch (authStatus) {
            case PHAuthorizationStatusAuthorized:
                if (afterAction) afterAction(StatusAuthorized);
                break;
            case PHAuthorizationStatusRestricted:
                if (afterAction) afterAction(StatusRestricted);
                break;
            case PHAuthorizationStatusDenied:
                if (afterAction) afterAction(StatusDenied);
                break;
            case PHAuthorizationStatusNotDetermined:
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                    if (status == PHAuthorizationStatusAuthorized) {
                        dispatch_async_on_main_queue(^{
                            if (afterAction) afterAction(StatusAuthorized);
                        });
                    }
                }];
                break;
        }
    }
    else{
        if (afterAction) afterAction(NotSupport);
    }
}

@end
