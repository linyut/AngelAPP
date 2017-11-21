//
//  ThemeColor.m
//  FrameProject
//
//  Created by mark on 2017/11/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "ThemeColor.h"

@interface ThemeColor()

@property (nonatomic,strong) NSDictionary *dictOfColors;

@end

@implementation ThemeColor

+ (instancetype)shareInstance {
    static ThemeColor *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        [self loadColorWithTheme:@"day"];
    }
    
    return self;
}

- (NSString*)getPathForResource:(NSString*)resourcName {
    NSString *path = nil;
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ColorResource" ofType:@"bundle"];
    NSBundle *colorResourceBundle = [NSBundle bundleWithPath:bundlePath];
    
    if (resourcName) {
        path = [colorResourceBundle pathForResource:resourcName ofType:@"plist"];
    }
    
    if (!path) {
        path = [colorResourceBundle.resourcePath stringByAppendingString:@"day.plist"];
    }
    
    return path;
}

- (void)loadColorWithTheme:(NSString*)themeName {
    self.dictOfColors = [NSDictionary dictionaryWithContentsOfFile:[self getPathForResource:themeName]];
    
}

- (UIColor*)colorWithName:(NSString*)colorName {
    UIColor *color = nil;
    
    NSString *colorStringValue = self.dictOfColors[colorName];
    if (colorStringValue) {
        color = [UIColor colorWithHexString:colorStringValue];
    }
    
    return color;
}

- (UIColor*)colorWithName:(NSString*)colorName alphaValue:(CGFloat)alpha {
    UIColor *color = [self colorWithName:colorName];
    
    if (color) {
        color = [color colorWithAlphaComponent:alpha];
    }
    
    return color;
}

@end
