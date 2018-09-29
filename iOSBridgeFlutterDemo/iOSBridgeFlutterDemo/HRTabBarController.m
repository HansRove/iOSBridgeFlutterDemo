//
//  HRTabBarController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "HRTabBarController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface HRTabBarController ()

@end

@implementation HRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *firstVC = [[ViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstNav.title = @"第一tab";
    [self addChildViewController:firstNav];
    
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    secondNav.title = @"第二tab";
    [self addChildViewController:secondNav];
}



@end
