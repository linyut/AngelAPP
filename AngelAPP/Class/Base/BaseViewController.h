//
//  BaseViewController.h
//  InternetBanking
//
//  Created by Simon on 16/6/12.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAlertController+Extend.h"
#import "UIImage+Extensions.h"
#import "UIColor+HexString.h"
#import "SVProgressHUD.h"

#define Message(msg) [SVProgressHUD showInfoWithStatus:msg]

@interface BaseViewController : UIViewController

@property (nonatomic,strong) NSDictionary *param;

- (void)formatAlertControllerWithTitle:(NSString *)titile message:(NSString *)message andBtnTitleArr:(NSArray*)arr hand:(void (^)(NSString *str))mBlocks;

- (void)formatAlertControllerWithTitle:(NSString *)titile message:(NSString *)message andBtnTitleArr:(NSArray*)arr withBtnStyles:(NSArray*)styles hand:(void (^)(NSString * str))mBlocks;

//tabbar子controller上使用，解决tabbarItem标题跟随navigationItem标题改变的问题
- (void)customTitle:(NSString*)title;
- (void)showBackButton:(BOOL)isShow;

///创建或替换导航栏右按钮
- (void)createNavigationRightButtonWithTitle:(NSString*)title;
- (void)createNavigationRightButtonWithImageNamed:(NSString*)imageNamed;

- (void)rightAction:(UIButton *)sender;
- (void)leftAction:(UIButton *)sender;

- (void)hideTabbarPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
