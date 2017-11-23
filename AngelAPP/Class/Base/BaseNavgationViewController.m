//
//  BaseNavgationViewController.m
//  PensionTreasure
//
//  Created by mark on 16/7/1.
//  Copyright © 2016年 BOC. All rights reserved.
//

#import "BaseNavgationViewController.h"

@interface BaseNavgationViewController ()

@end

@implementation BaseNavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationBar setShadowImage:[UIImage new]];
//    UIImage *image = [[UIImage imageNamed:@"navbar"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
//    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    //设置导航栏的文字颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19]}];
    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    self.navigationBar.translucent=NO;
    [self.navigationBar setTintColor:[UIColor blackColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//修改状态栏的样式
//- (UIStatusBarStyle) preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


@end
