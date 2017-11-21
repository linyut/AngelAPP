//
//  ThemeImage.h
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeImage : NSObject

+ (instancetype)shareInstance;

- (void)setThemeName:(NSString*)themeName;
- (UIImage*)imageWithName:(NSString*)imageName;

@end
