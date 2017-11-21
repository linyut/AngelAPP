//
//  HTTPManager.h
//  InternetBanking
//
//  Created by Mark on 16/6/30.
//  Copyright © 2016年 BOC. All rights reserved.
//


#import "ErrorInfoModel.h"

@interface HTTPManager : NSObject

@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

+ (instancetype)manager;

/*
 header          如果有需要自定义报文头则传入自定义报文头，如果使用公共报文头则传入nil
 postUrl         输入请求路径地址
 parametersBody  接口上送报文体
 success         请求成功返回
 failure         请求失败返回
 */

- (NSURLSessionTask*)requestPOSTURL:(NSString *)postUrl
                             header:(NSDictionary *)header
                     parametersBody:(NSDictionary *)parametersBody
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(ErrorInfoModel *error))failure;

- (NSDictionary*)constructPostHeader;

- (void)cancelAllDataTasks;
- (void)cancelLastDataTask;

@end
