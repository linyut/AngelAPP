//
//  ProvinceInfoModel.h
//  PBPS-MA
//
//  Created by tk on 2017/1/20.
//  Copyright © 2017年 BOC_ezdb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceInfoModel : NSObject

@property (nonatomic,copy) NSString *alias;//别名
@property (nonatomic,copy) NSString *id;//id
@property (nonatomic,copy) NSString *name;//全名
@property (nonatomic,copy) NSString *parentid;//parentid

@end
