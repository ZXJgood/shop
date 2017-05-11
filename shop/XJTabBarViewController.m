//
//  XJTabBarViewController.m
//  shop
//
//  Created by 晓佳 on 2017/5/9.
//  Copyright © 2017年 晓佳. All rights reserved.
//

#import "XJTabBarViewController.h"
#import "XJNavigationViewController.h"

@interface XJTabBarViewController ()
@property (strong, nonatomic)   NSArray *viewControllerArray;//存放view信息的数组

@end

@implementation XJTabBarViewController

- (NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        _viewControllerArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]];
    }
    return _viewControllerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:56/255.0 green:165/255.0 blue:241/255.0 alpha:1]} forState:(UIControlStateSelected)];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1]} forState:(UIControlStateNormal)];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_back"]];
    for (NSDictionary *dic in self.viewControllerArray) {
        Class view = NSClassFromString(dic[@"viewController"]);
        UIViewController *viewController = [[view alloc]init];
        viewController.tabBarItem.image = [UIImage imageNamed:dic[@"image"]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"selectImage"]];
        viewController.title = dic[@"title"];
        XJNavigationViewController *nav = [[XJNavigationViewController alloc]initWithRootViewController:viewController];
        [self addChildViewController:nav];
    }
    
}

@end
