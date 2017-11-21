//
//  ThemeManager.m
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+ (void)loadThemeWithName:(NSString*)themeName {
    [[ThemeColor shareInstance] loadColorWithTheme:themeName];
    [[ThemeImage shareInstance] setThemeName:themeName];
}

@end
