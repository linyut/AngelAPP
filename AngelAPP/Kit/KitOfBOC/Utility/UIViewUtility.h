//
//  UIViewUtility.h
//  PBPS-MA
//
//  Created by tk on 2017/1/4.
//  Copyright © 2017年 BOC_ezdb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewUtility : UIView

///根据限制长度判断是否能替换textFeild的内容
+ (BOOL)canReplaceString:(NSString*)string withTextField:(UITextField*)textField withLimitedLength:(NSInteger)limitedLength;

///根据限制长度判断是否能替换textView的内容
+ (BOOL)canReplaceString:(NSString*)string withTextView:(UITextView*)textView withLimitedLength:(NSInteger)limitedLength;

///根据限制长度截取textField的内容
+ (void)trimTextField:(UITextField*)textField withLimitedLength:(NSInteger)limitedLength;

///根据限制长度截取textView的内容
+ (void)trimTextView:(UITextView*)textView withLimitedLength:(NSInteger)limitedLength;

@end
