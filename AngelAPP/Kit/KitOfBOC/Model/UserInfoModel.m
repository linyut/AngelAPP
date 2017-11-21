//
//  UserInfoModel.m
//  VitalityBOC
//
//  Created by tk on 16/12/22.
//  Copyright © 2016年 BOC_ezdb. All rights reserved.
//

#import "UserInfoModel.h"
#import "AESCrypt.h"

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
        self.uid = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kUid] password:KCodingPassWord];
        self.ehrId = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kEhrId] password:KCodingPassWord];
        self.sessionid = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kSessionid] password:KCodingPassWord];
        self.userID = [AESCrypt decrypt:[aDecoder decodeObjectForKey:kUserID] password:KCodingPassWord];
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
    [aCoder encodeObject:[AESCrypt encrypt:self.uid password:KCodingPassWord] forKey:kUid];
    [aCoder encodeObject:[AESCrypt encrypt:self.ehrId password:KCodingPassWord] forKey:kEhrId];
    [aCoder encodeObject:[AESCrypt encrypt:self.sessionid password:KCodingPassWord] forKey:kSessionid];
    [aCoder encodeObject:[AESCrypt encrypt:self.userID password:KCodingPassWord] forKey:kUserID];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
