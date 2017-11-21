//
//  UIAlertController+Extend.h
//  PBPS-MA
//
//  Created by tk on 2017/2/14.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController(Extend)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSInteger)supportedInterfaceOrientations;
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations;
#endif

@end
