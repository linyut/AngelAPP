//
//  EnvManager.m
//  PBPS-MA
//
//  Created by Mac on 2017/1/12.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "EnvManager.h"

@implementation EnvManager

static HttpServiceType _serviceType =  1;

static NSString* baseUrlP = @"https://pbps.bank-of-china.com/pbpsma/";
static NSString* baseUrlT = @"http://22.188.111.105:8080/pbpsma/";
static NSString* baseUrlD = @"http://22.188.14.44:8080/pbpsma/";

+ (void)changeEnvToService:(HttpServiceType)serviceType {
    _serviceType = serviceType;
}

+ (NSString*)baseUrl {
    if (_serviceType == HttpServiceProduct) {
        return baseUrlP;
    }
    else if (_serviceType == HttpServiceTest) {
        return baseUrlT;
    }
    else {
        return baseUrlD;
    }
}

+ (NSString*)getFullUrl:(NSString *)relativeUrl {
    NSParameterAssert(relativeUrl);
    return [[EnvManager baseUrl] stringByAppendingString:relativeUrl];
}

@end
