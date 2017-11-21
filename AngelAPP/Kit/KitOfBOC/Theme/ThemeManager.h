//
//  ThemeManager.h
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeColor.h"
#import "ThemeImage.h"

@interface ThemeManager : NSObject

+ (void)loadThemeWithName:(NSString*)themeName;

@end
