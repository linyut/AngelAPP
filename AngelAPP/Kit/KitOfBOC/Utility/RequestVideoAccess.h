//
//  RequestVideoAccess.h
//  PBPS-MA
//
//  Created by mark on 2017/10/26.
//  Copyright © 2017年 BOC_PBPS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ECheckResult) {
    NotSupport = 0,//不支持
    StatusRestricted,//因为系统原因, 无法访问（家长控制）
    StatusDenied,//权限已设置不允许访问，可以重新设置
    StatusAuthorized//权限已授权可以正常使用
};

@interface RequestVideoAccess : NSObject

+ (void)checkAccessVideoAfterAction:(void(^)(ECheckResult CheckStatus))afterAction;
+ (void)checkAccessPhotoLibraryAfterAction:(void(^)(ECheckResult CheckStatus))afterAction;

@end
