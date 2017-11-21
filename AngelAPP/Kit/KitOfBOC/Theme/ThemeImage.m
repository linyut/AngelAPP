//
//  ThemeImage.m
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "ThemeImage.h"

@interface ThemeImage() {
    NSString *_themeName;
}

@end

@implementation ThemeImage

+ (instancetype)shareInstance {
    static ThemeImage *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _themeName = @"day";
    }
    
    return self;
}

- (void)setThemeName:(NSString*)themeName {
    _themeName = themeName;
}

- (UIImage*)imageWithName:(NSString*)imageName {
    UIImage *image = nil;
    if (imageName) {
        NSString *name = [imageName stringByAppendingFormat:@"_%@",_themeName];
        image = [UIImage imageNamed:name];
    }
    
    return image;
}

@end
