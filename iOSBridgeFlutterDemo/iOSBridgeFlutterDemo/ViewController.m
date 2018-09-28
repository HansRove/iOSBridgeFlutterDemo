//
//  ViewController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"第一tab";
    
    UIButton *pushButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    pushButton.frame = CGRectMake(50, 100, 120, 50);
    pushButton.backgroundColor = [UIColor redColor];
    
    [pushButton setTitle:@"跳转Flutter" forState:(UIControlStateNormal)];
    [pushButton addTarget:self action:@selector(pushFlutter) forControlEvents:(UIControlEventTouchUpInside)];
}

    - (void)pushFlutter {
        
    }

@end
