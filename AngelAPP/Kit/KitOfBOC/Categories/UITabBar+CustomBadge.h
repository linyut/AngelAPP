//
//  UITabBar+CustomBadge.h
//  PBPS-MA
//
//  Created by tk on 2017/1/13.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar(CustomBadge)

- (void)showBadgeAtIndex:(NSInteger)index;
- (void)hideBadgeAtIndex:(NSInteger)index;
- (void)setShowStatus:(BOOL)isShow atIndex:(NSInteger)index;

@end
