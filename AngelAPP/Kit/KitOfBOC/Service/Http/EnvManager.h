//
//  EnvManager.h
//  PBPS-MA
//
//  Created by Mac on 2017/1/12.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnvManager : NSObject

typedef NS_ENUM(NSInteger,HttpServiceType) {
    HttpServiceProduct = 0,
    HttpServiceTest,
    HttpServiceDevelopment
};
//切换环境到相应的服务器
+ (void)changeEnvToService:(HttpServiceType)serviceType;
+ (NSString*)baseUrl;
+ (NSString*)getFullUrl:(NSString*)relativeUrl;

@end
