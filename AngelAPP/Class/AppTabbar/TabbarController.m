//
//  TabbarController.m
//  VitalityBOC
//
//  Created by tk on 16/12/21.
//  Copyright © 2016年 BOC_ezdb. All rights reserved.
//

#import "TabbarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "BaseNavgationViewController.h"
#import "UITabBar+CustomBadge.h"

@interface TabbarController ()<UITabBarDelegate>

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建子控制器
    UIViewController * home = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[BaseNavgationViewController alloc] initWithRootViewController:home];
    
    UIViewController *message = [[MessageViewController alloc]init];
    UINavigationController *messageNav = [[BaseNavgationViewController alloc] initWithRootViewController:message];
    
    UIViewController *mine = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[BaseNavgationViewController alloc] initWithRootViewController:mine];
    
    self.viewControllers = @[homeNav,messageNav,mineNav];
    
    NSArray *titles = @[@"首页",@"消息",@"我的"];
    NSArray *normalArr = @[@"icon_home_gray",@"icon_message_gray",@"icon_mine_gray"];
    NSArray *selectArr = @[@"icon_home_orange",@"icon_message_orange",@"icon_mine_orange"];

    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.barTintColor = [UIColor colorWithHexString:@"E5E5E5"];

    int index = 0;
    for (UITabBarItem *item in self.tabBar.items) {
        UIImage *image = [[UIImage imageNamed:normalArr[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setImage:image];
        
        UIImage *selectedimage = [[UIImage imageNamed:normalArr[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setSelectedImage:selectedimage];
        
        [item setTitle:titles[index]];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];//[UIColor colorWithHexString:@"4A4A4A"]
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"F66652"]} forState:UIControlStateSelected];//B21521
        
        [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];
        index++;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBadge:) name:@"UpdateBadgeStatus" object:nil];
}

- (void)updateBadge:(NSNotification*)sender {
    NSDictionary *badgeInfo = (NSDictionary*)(sender.object);
    [self setBadgeStatusWithInfo:badgeInfo];
}

- (void)setBadgeStatusWithInfo:(NSDictionary*)statusInfo {
    if (statusInfo) {
        NSInteger index = [statusInfo[@"index"] integerValue];
        BOOL showStatus = [statusInfo[@"show"] boolValue];
        [self.tabBar setShowStatus:showStatus atIndex:index];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
