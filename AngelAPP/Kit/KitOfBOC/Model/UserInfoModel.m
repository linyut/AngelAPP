//
//  UserInfoModel.m
//  VitalityBOC
//
//  Created by tk on 16/12/22.
//  Copyright © 2016年 BOC_ezdb. All rights reserved.
//

#import "UserInfoModel.h"

//#define kBirthDay             @"birthDay"
//#define kBusinessTel          @"businessTel"
//#define kEmailAddress         @"emailAddress"
//#define kHeadPortrait         @"headPortrait"
//#define kIDCardNo             @"IDCardNo"
//#define kMobilePhone          @"mobilePhone"
//#define kNation               @"nation"
//#define kNativePlace          @"nativePlace"
//#define kOrganizationName     @"organizationName"
//#define kPoliticsStatus       @"politicsStatus"
//#define kSex                  @"sex"
//#define kUserName             @"userName"
#define kUid                  @"uid"
#define kEhrId                @"ehrId"
#define kSessionid            @"sessionid"
#define kUserID               @"userID"

#define KCodingPassWord             @"#$%^&12RT"

@implementation UserInfoModel



- (NSString*)uid {
    if ([_uid isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)_uid stringValue];
    }
    else {
        return _uid;
    }
}

#pragma mark NSSecureCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
//        self.birthDay = [aDecoder decodeObjectForKey:kBirthDay];
//        self.businessTel = [aDecoder decodeObjectForKey:kBusinessTel];
//        self.emailAddress = [aDecoder decodeObjectForKey:kEmailAddress];
//        self.headPortrait = [aDecoder decodeObjectForKey:kHeadPortrait];
//        self.IDCardNo = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kIDCardNo] password:KCodingPassWord] ;
//        self.mobilePhone = [aDecoder decodeObjectForKey:kMobilePhone];
//        self.nation = [aDecoder decodeObjectForKey:kNation];
//        self.nativePlace = [aDecoder decodeObjectForKey:kNativePlace];
//        self.organizationName = [aDecoder decodeObjectForKey:kOrganizationName];
//        self.politicsStatus = [aDecoder decodeObjectForKey:kPoliticsStatus];
//        self.sex = [aDecoder decodeObjectForKey:kSex];
//        self.userName = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kUserName] password:KCodingPassWord];
        self.uid = [CocoaSecurity aesDecryptWithBase64:[aDecoder decodeObjectForKey:kUid] key:KCodingPassWord].base64;
        self.ehrId = [CocoaSecurity aesDecryptWithBase64:[aDecoder decodeObjectForKey:kEhrId] key:KCodingPassWord].base64;
        self.sessionid = [CocoaSecurity aesDecryptWithBase64:[aDecoder decodeObjectForKey:kSessionid] key:KCodingPassWord].base64;
        self.userID = [CocoaSecurity aesDecryptWithBase64:[aDecoder decodeObjectForKey:kUserID] key:KCodingPassWord].base64;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.birthDay forKey:kBirthDay];
//    [aCoder encodeObject:self.businessTel forKey:kBusinessTel];
//    [aCoder encodeObject:self.emailAddress forKey:kEmailAddress];
//    [aCoder encodeObject:self.headPortrait forKey:kHeadPortrait];
//    [aCoder encodeObject:[AESCrypt encrypt:self.IDCardNo password:KCodingPassWord] forKey:kIDCardNo];
//    [aCoder encodeObject:self.mobilePhone forKey:kMobilePhone];
//    [aCoder encodeObject:self.nation forKey:kNation];
//    [aCoder encodeObject:self.nativePlace forKey:kNativePlace];
//    [aCoder encodeObject:self.organizationName forKey:kOrganizationName];
//    [aCoder encodeObject:self.politicsStatus forKey:kPoliticsStatus];
//    [aCoder encodeObject:self.sex forKey:kSex];
//    [aCoder encodeObject:[AESCrypt encrypt:self.userName password:KCodingPassWord] forKey:kUserName];
    [aCoder encodeObject:[CocoaSecurity aesEncrypt:self.uid key:KCodingPassWord] forKey:kUid];
    [aCoder encodeObject:[CocoaSecurity aesEncrypt:self.ehrId key:KCodingPassWord] forKey:kEhrId];
    [aCoder encodeObject:[CocoaSecurity aesEncrypt:self.sessionid key:KCodingPassWord] forKey:kSessionid];
    [aCoder encodeObject:[CocoaSecurity aesEncrypt:self.userID key:KCodingPassWord] forKey:kUserID];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
