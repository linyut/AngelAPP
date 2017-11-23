//
//  BaseViewController.m
//  InternetBanking
//
//  Created by Simon on 16/6/12.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import "BaseViewController.h"
#import "IQKeyboardManager.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if([self automaticallyAdjustsScrollViewInsets]){
        self.automaticallyAdjustsScrollViewInsets=NO;

    }
    
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside =YES;
    [self showBackButton:YES];
}

- (void)formatAlertControllerWithTitle:(NSString *)titile message:(NSString *)message andBtnTitleArr:(NSArray*)arr hand:( void (^)(NSString *str) )mBlocks
{
    [self formatAlertControllerWithTitle:titile message:message andBtnTitleArr:arr withBtnStyles:nil hand:^(NSString *str) {
        if (mBlocks) mBlocks(str);
    }];
}

- (void)formatAlertControllerWithTitle:(NSString *)titile message:(NSString *)message andBtnTitleArr:(NSArray*)arr withBtnStyles:(NSArray*)styles hand:( void (^)(NSString * str) )mBlocks {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titile message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (!arr) {
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            mBlocks(@"确定");
            NSLog(@"Click AlertController Default");
        }]];
    }
    else {
        NSInteger index = 0;
        for (NSString *title in arr) {
            UIAlertActionStyle style = UIAlertActionStyleDefault;
            if (styles && index < styles.count) {
                style = [styles[index] integerValue];
            }
            
            UIAlertAction *actionItem = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *action) {
                if (mBlocks) mBlocks(action.title);
                NSLog(@"click action title:%@",action.title);
            }];
            [alertController addAction:actionItem];
            index++;
        }
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)customTitle:(NSString*)title {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 40)];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:19]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.navigationItem setTitleView:titleLabel];
}

- (void)showBackButton:(BOOL)isShow {
    
    UIBarButtonItem *spaceItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -6;
    
    UIBarButtonItem *item;
    if (isShow) {
        item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    }
    else {
        item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageWithColor:[UIColor clearColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    
    self.navigationItem.leftBarButtonItems = @[spaceItem,item];
}

- (void)leftAction:(UIButton *)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

///创建或替换导航栏右按钮
- (void)createNavigationRightButtonWithTitle:(NSString*)title {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    item.imageInsets = UIEdgeInsetsMake(10,-15,-10,15);
    
    self.navigationItem.rightBarButtonItems = @[item];
}

- (void)createNavigationRightButtonWithImageNamed:(NSString*)imageNamed {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageNamed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    item.imageInsets = UIEdgeInsetsMake(10,-15,-10,15);
    self.navigationItem.rightBarButtonItems = @[item];
}

- (void)rightAction:(UIButton *)sender
{
    
}

- (void)hideTabbarPushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
