//
//  XJNavigationViewController.m
//  shop
//
//  Created by 晓佳 on 2017/5/9.
//  Copyright © 2017年 晓佳. All rights reserved.
//

#import "XJNavigationViewController.h"

@interface XJNavigationViewController ()

@end

@implementation XJNavigationViewController

+ (void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:(UIBarMetricsDefault)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) {
        UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:(UIControlStateNormal)];
        [backBtn addTarget:self action:@selector(returnViewController) forControlEvents:(UIControlEventTouchUpInside)];
        backBtn.frame = CGRectMake(0, 0, 30, 30);
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = item;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)returnViewController{
    [self popViewControllerAnimated:YES];
}

@end
