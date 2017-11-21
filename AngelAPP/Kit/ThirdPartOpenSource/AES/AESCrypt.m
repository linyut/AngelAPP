//
//  AESCrypt.m
//  Nov_NSUserDefule
//
//  Created by Simon on 14/11/3.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "AESCrypt.h"

#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"

@implementation AESCrypt

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password {
  NSData *encryptedData = [[message dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
  NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
  return base64EncodedString;
}

+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password {
  NSData *encryptedData = [NSData base64DataFromString:base64EncodedString];
  NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
  return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}

+ (NSMutableDictionary*)encryptDict:(NSDictionary *)messagDict
{
    NSString *valueStr=nil;
    NSMutableDictionary *encryptDict = [[NSMutableDictionary alloc] init];
    
    for(NSString *keyStr in [messagDict allKeys])
    {

        valueStr =[NSString stringWithFormat:@"%@",[messagDict objectForKey:keyStr]] ;
        NSData *encryptedData = [[valueStr dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[keyStr dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
        NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
        [encryptDict setObject:base64EncodedString forKey:keyStr];
    }
    return encryptDict;
}



+(NSMutableDictionary*)decryptDict:(NSDictionary *)base64EncodedDict
{
    NSString *decryptValueStr=nil;
    NSMutableDictionary *decryptDict = [[NSMutableDictionary alloc] init];
    
    for(NSString *decryptKeyStr in [base64EncodedDict allKeys])
    {
        decryptValueStr = [base64EncodedDict objectForKey:decryptKeyStr];
        NSData *encryptedData = [NSData base64DataFromString:decryptValueStr];
        NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[decryptKeyStr dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
        NSString *decyptString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
        [decryptDict setObject:decyptString forKey:decryptKeyStr];
    
        
        
        
    }
    return decryptDict;
}

+ (NSMutableDictionary*)encryptAuthorizeDict:(NSMutableDictionary *)messagAuthorizeDict
{
    NSString *valueStr=nil;
    NSMutableDictionary *encryptDict = [[NSMutableDictionary alloc] init];
    
    for(NSString *keyStr in [messagAuthorizeDict allKeys])
    {
        valueStr = [messagAuthorizeDict objectForKey:keyStr];
        NSData *encryptedData = [[valueStr dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[keyStr dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
        NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
        [encryptDict setObject:base64EncodedString forKey:keyStr];
    }
    return encryptDict;
}

+(NSMutableDictionary*)decryptAuthorizeDict:(NSMutableDictionary *)base64AuthorizeEncodedDict
{
    NSString *decryptValueStr=nil;
    NSMutableDictionary *decryptDict = [[NSMutableDictionary alloc] init];
    
    for(NSString *decryptKeyStr in [base64AuthorizeEncodedDict allKeys])
    {
        decryptValueStr = [base64AuthorizeEncodedDict objectForKey:decryptKeyStr];
        NSData *encryptedData = [NSData base64DataFromString:decryptValueStr];
        NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[decryptKeyStr dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
        NSString *decyptString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
        [decryptDict setObject:decyptString forKey:decryptKeyStr];
        
        
        
        
    }
    return decryptDict;
}


@end
