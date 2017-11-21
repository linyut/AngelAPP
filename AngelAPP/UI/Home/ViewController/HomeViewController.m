//
//  HomeViewController.m
//  FrameProject
//
//  Created by mark on 2017/8/9.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"

@interface HomeViewController ()

@property (nonatomic,strong) HomeViewModel *model;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customTitle:@"首页"];
    [self showBackButton:NO];
    
}

- (void)queryAction {
    [_model requestAllProvinceWithParam:nil success:^(NSDictionary *result) {
        ;
    } failure:^(ErrorInfoModel *error) {
        Message(error.errorMsg);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
