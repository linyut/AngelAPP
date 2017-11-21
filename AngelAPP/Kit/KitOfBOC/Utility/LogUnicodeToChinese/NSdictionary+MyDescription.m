//
//  NSdictionary+MyDescription.m
//  PensionTreasure
//
//  Created by mark on 16/8/5.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import "NSdictionary+MyDescription.h"

@implementation NSDictionary(unicode)

- (NSString*)my_description {
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
