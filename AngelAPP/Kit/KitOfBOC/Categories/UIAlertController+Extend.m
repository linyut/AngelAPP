//
//  UIAlertController+Extend.m
//  PBPS-MA
//
//  Created by tk on 2017/2/14.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "UIAlertController+Extend.h"



@implementation UIAlertController(Extend)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end
