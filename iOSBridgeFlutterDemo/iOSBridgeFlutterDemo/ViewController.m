//
//  ViewController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"第一tab";
    
    UIButton *pushButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view  addSubview:pushButton];
    pushButton.frame = CGRectMake(50, 250, 120, 50);
    pushButton.backgroundColor = [UIColor redColor];
    
    [pushButton setTitle:@"跳转Flutter" forState:(UIControlStateNormal)];
    [pushButton addTarget:self action:@selector(pushFlutter) forControlEvents:(UIControlEventTouchUpInside)];
}

    - (void)pushFlutter {
        FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
        flutterViewController.navigationItem.title = @"Flutter Demo";
        //    __weak __typeof(self) weakSelf = self;
        //    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:
        //                           @"ViewController.channel" binaryMessenger:flutterViewController];
        //
        //    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        ////        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        //        [weakSelf.navigationController popViewControllerAnimated:YES];
        //    }];
        
        //    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:@"com.banggood.bgaff/test" binaryMessenger:flutterViewController];
        //    [evenChannal setStreamHandler:self];
        
        //    [self presentViewController:flutterViewController animated:YES completion:nil];
        [self.navigationController pushViewController:flutterViewController animated:YES];
    }

@end
