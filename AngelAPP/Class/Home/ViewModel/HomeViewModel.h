//
//  HomeViewModel.h
//  FrameProject
//
//  Created by mark on 2017/8/9.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel

//查询云支部
- (void)requestAllProvinceWithParam:(NSDictionary*)param
                            success:(void (^)(NSDictionary *result))success
                            failure:(void (^)(ErrorInfoModel *error))failure;

@end
