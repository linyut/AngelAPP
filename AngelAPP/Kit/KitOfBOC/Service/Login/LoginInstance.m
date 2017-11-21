//
//  LoginInstance.m
//  VitalityBOC
//
//  Created by Boc on 16/12/21.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import "LoginInstance.h"

@interface LoginInstance() {
    
}

@end

@implementation LoginInstance

+ (instancetype)shareInstance {
    static LoginInstance *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance readLoginInfo];
    });
    
    return instance;
}


- (void)saveUserLoginInfo {
    [[NSUserDefaults standardUserDefaults] setObject:@(_isLogin) forKey:@"LoginStatus"];
    [NSKeyedArchiver archiveRootObject:_userInfo toFile:[self getFilePath]];
}

- (void)readLoginInfo {
    BOOL isLogin = [[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginStatus"] boolValue];
    if (isLogin) {
        _userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getFilePath]];
        if (_userInfo) {
            _isLogin = isLogin;
        }
        else {
            _isLogin = NO;
        }
    }
}

- (NSString*)getFilePath {
    NSString *path = [NSString stringWithFormat:@"%@/Documents/user",NSHomeDirectory()];
    return path;
}


@end
