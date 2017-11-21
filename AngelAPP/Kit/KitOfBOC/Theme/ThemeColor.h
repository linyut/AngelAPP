//
//  ThemeColor.h
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeColor : NSObject

+ (instancetype)shareInstance;

- (void)loadColorWithTheme:(NSString*)themeName;

- (UIColor*)colorWithName:(NSString*)colorName;
- (UIColor*)colorWithName:(NSString*)colorName alphaValue:(CGFloat)alpha;

@end
