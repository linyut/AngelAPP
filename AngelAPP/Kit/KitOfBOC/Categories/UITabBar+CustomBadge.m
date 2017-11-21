//
//  UITabBar+CustomBadge.m
//  PBPS-MA
//
//  Created by tk on 2017/1/13.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "UITabBar+CustomBadge.h"

#define kBaseId 1000

@implementation UITabBar(CustomBadge)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)showBadgeAtIndex:(NSInteger)index {
    NSArray *barButtons = [self barButtons];
    if (index >= barButtons.count) {
        return;
    }
    UIView *barButton = barButtons[index];
    UIView *badgeView = [barButton viewWithTag:kBaseId + index];
    
    if (badgeView) {
        badgeView.hidden = NO;
    }
    else {
        badgeView = [self createBadgeViewWithCenterX:barButton.width * 0.5];
        badgeView.tag = kBaseId + index;
        [barButton addSubview:badgeView];
    }
}

- (void)hideBadgeAtIndex:(NSInteger)index {
    NSArray *barButtons = [self barButtons];
    if (index >= barButtons.count) {
        return;
    }
    UIView *barButton = barButtons[index];
    UIView *badgeView = [barButton viewWithTag:kBaseId + index];
    if (badgeView) {
        badgeView.hidden = YES;
    }
}

- (void)setShowStatus:(BOOL)isShow atIndex:(NSInteger)index {
    if (isShow) {
        [self showBadgeAtIndex:index];
    }
    else {
        [self hideBadgeAtIndex:index];
    }
}

- (UIView*)createBadgeViewWithCenterX:(CGFloat)x {
    UIView *badgeView = [[UIView alloc] init];
    badgeView.frame = CGRectMake(x + 10, 10, 8, 8);
    badgeView.backgroundColor = [UIColor redColor];
    badgeView.layer.cornerRadius = badgeView.width * 0.5;
    badgeView.clipsToBounds = YES;
    return badgeView;
}

- (NSArray*)barButtons {
    NSMutableArray *barBtns = [[NSMutableArray alloc] init];
    for (UIView *view in self.subviews) {
        if ([view.className isEqualToString:@"UITabBarButton"]) {
            [barBtns addObject:view];
        }
    }
    return barBtns;
}

@end
