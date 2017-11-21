//
//  AESCrypt.h
//  Nov_NSUserDefule
//
//  Created by Simon on 14/11/3.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESCrypt : NSObject


+(NSMutableDictionary*)encryptDict:(NSDictionary*)messagDict;
+(NSMutableDictionary*)decryptDict:(NSDictionary*)base64EncodedDict;

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;
+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;


+(NSMutableDictionary*)encryptAuthorizeDict:(NSMutableDictionary*)messagAuthorizeDict;
+(NSMutableDictionary*)decryptAuthorizeDict:(NSMutableDictionary*)base64AuthorizeEncodedDict;


@end
