//
//  HomeViewModel.m
//  FrameProject
//
//  Created by mark on 2017/8/9.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "HomeViewModel.h"
#import "ProvinceInfoModel.h"

@implementation HomeViewModel

- (void)requestAllProvinceWithParam:(NSDictionary*)param
                            success:(void (^)(NSDictionary *result))success
                            failure:(void (^)(ErrorInfoModel *error))failure {
    HTTPManager *httpMan = [HTTPManager manager];
    
    [httpMan requestPOSTURL:URL_QueryAllProvince header:nil parametersBody:param success:^(id responseObject) {
        NSDictionary *result = (NSDictionary*)responseObject;
        NSArray *data = result[@"otherInfo"][@"data"];
        if (success) {
            success([self provinceInfoDictToModel:data]);
        }
    } failure:^(ErrorInfoModel *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

- (NSDictionary *)provinceInfoDictToModel:(NSArray*)provinceInfos {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in provinceInfos) {
        ProvinceInfoModel *model = [ProvinceInfoModel yy_modelWithDictionary:dict];
        [result addObject:model];
    }
    
    return @{@"result":result};
}

@end
