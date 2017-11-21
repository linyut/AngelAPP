//
//  HTTPManager.m
//  InternetBanking
//
//  Created by Mark on 16/6/30.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import "HTTPManager.h"
#import "LoginInstance.h"
#import "EnvManager.h"

#ifdef DEBUG
#import "JRSwizzle.h"
#import "NSdictionary+MyDescription.h"
#endif

static HTTPManager *_instanceSingle = nil;

@implementation HTTPManager


+ (instancetype )manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#ifdef DEBUG
        [NSDictionary jr_swizzleMethod:@selector(description) withMethod:@selector(my_description) error:nil];
#endif
        _instanceSingle = [[self alloc] init];
    });

    return _instanceSingle;

}

- (AFHTTPSessionManager*)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
//        NSURL *baseUrl = [NSURL URLWithString:[EnvManager baseUrl]];
//        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    }
    
    return _sessionManager;
}

- (NSURLSessionTask*)requestPOSTURL:(NSString *)postUrl
                header:(NSDictionary *)header
        parametersBody:(NSDictionary *)parametersBody
               success:(void (^)(id responseObject))success
               failure:(void (^)(ErrorInfoModel *error))failure
{
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    self.sessionManager.requestSerializer.timeoutInterval = 20.0;

    self.sessionManager.securityPolicy.allowInvalidCertificates = NO;
    
    if (header) {
        
//        [self.sessionManager.requestSerializer setCustomValueForHTTPHeaderDict:header];
    }else{
//        [self.sessionManager.requestSerializer setCustomValueForHTTPHeaderDict:[self constructPostHeader]];
    }
    
    NSLog(@"post url:%@",postUrl);
    NSLog(@"headers:%@ ",self.sessionManager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"postBody:%@",parametersBody);

    NSURLSessionTask *task = [self.sessionManager POST:postUrl parameters:parametersBody progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self printResponse:responseObject withUrl:postUrl];
        
        if (![responseObject isKindOfClass:[NSDictionary class]]) {//返回类型错误报错处理
            ErrorInfoModel *error = [self errorInfoWithErrorCode:@"[APP]" errorMsg:@"数据解析错误！"];
            if (failure) failure(error);
        }
        else {//返回数据类型正确
            NSDictionary *responseDict = responseObject;
            NSString *errorCode = responseDict[@"flag"];//实际返回的错误码
            if ([errorCode isEqualToString:@"0000000"]) {//正常数据
                if (success) success(responseObject);
            }
            else {//异常数据处理
                NSString *errorMsg = responseDict[@"msg"];
                ErrorInfoModel *error = [self errorInfoWithErrorCode:errorCode errorMsg:errorMsg];
                if (failure) failure(error);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if (failure) {
            failure([self errorInfoWithSystemError:error]);
        }
        NSLog(@"error: %@",error);
        
    }];
    
    return task;
}

//构建公共报文头
- (NSDictionary*)constructPostHeader {
    NSString *sessionID = @"";
    NSString *uid = @"";
    LoginInstance *instance = [LoginInstance shareInstance];
    if (instance.isLogin) {
        sessionID = [@"JSESSIONID=" stringByAppendingString:instance.userInfo.sessionid];
        uid = instance.userInfo.uid;
    }
    NSDictionary *formatRequestHeader = @{
                                          @"uid":uid,
                                          @"cookie":sessionID
                                          };
    
    return formatRequestHeader;
}

- (void)cancelAllDataTasks {
    NSArray *dataTasks = self.sessionManager.dataTasks;
    for (NSURLSessionTask *task in dataTasks) {
        [task cancel];
    }
}

- (void)cancelLastDataTask {
    NSArray *dataTasks = self.sessionManager.dataTasks;
    NSURLSessionTask *task = dataTasks.lastObject;
    [task cancel];
}

//打印返回报文
- (void)printResponse:(id)response withUrl:(NSString*)urlString {
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = response;
        id description = [dict description];
        if (description) {
            NSLog(@"%@返回报文：%@",urlString,description);
        }
        else {
            NSLog(@"%@返回报文：%@",urlString,dict);
        }
    }
    else {
        NSLog(@"%@返回报文：%@",urlString,response);
    }
}

- (ErrorInfoModel*)errorInfoWithErrorCode:(NSString*)code errorMsg:(NSString*)msg {
    ErrorInfoModel *errorInfo = [[ErrorInfoModel alloc] init];
    errorInfo.errorCode = code;
    errorInfo.errorMsg = msg;
    return errorInfo;
}

- (ErrorInfoModel*)errorInfoWithSystemError:(NSError*)error {
    NSNumber *code = [NSNumber numberWithInteger:error.code];
    NSString *errorCode = [code stringValue];
    NSString *errorMessage = [error localizedDescription];
    
    return [self errorInfoWithErrorCode:errorCode errorMsg:errorMessage];
}

@end
