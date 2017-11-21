//
//  LoginInstance.h
//  baseProject
//
//  Created by Mark on 16/12/21.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface LoginInstance : NSObject

@property (nonatomic,assign) BOOL isLogin;
@property (nonatomic,strong) UserInfoModel *userInfo;

+ (instancetype)shareInstance;


@end
