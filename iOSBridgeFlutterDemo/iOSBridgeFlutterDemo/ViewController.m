//
//  ViewController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "ThirdViewController.h"

@interface ViewController ()<FlutterStreamHandler>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"第一tab";
    
    UIButton *pushButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view  addSubview:pushButton];
    pushButton.frame = CGRectMake(0, 250, 320, 50);
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton setTitle:@"跳转Flutter-MethodChannel" forState:(UIControlStateNormal)];
    [pushButton addTarget:self action:@selector(pushFlutterViewController_MethodChannel) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *pushButton1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view  addSubview:pushButton1];
    pushButton1.frame = CGRectMake(0, 380, 320, 50);
    pushButton1.backgroundColor = [UIColor redColor];
    [pushButton1 setTitle:@"跳转Flutter-EventChannel" forState:(UIControlStateNormal)];
    [pushButton1 addTarget:self action:@selector(pushFlutterViewController_EventChannel) forControlEvents:(UIControlEventTouchUpInside)];
}

    - (void)pushFlutterViewController_MethodChannel {
        FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
        flutterViewController.navigationItem.title = @"MethodChannel Demo";
            __weak __typeof(self) weakSelf = self;
        
        // 要与main.dart中一致
        NSString *channelName = @"com.pages.your/native_get";
        
            FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
        
            [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
                // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
                // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
                // result 是给flutter的回调
                NSLog(@"flutter 给到我：\nmethod=%@ \narguments = %@",call.method,call.arguments);
                
                if ([call.method isEqualToString:@"toNativeSomething"]) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"flutter回调" message:[NSString stringWithFormat:@"%@",call.arguments] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                    [alertView show];
                    
                    // 回调给flutter
                    if (result) {
                        result(@1000);
                    }
                } else if ([call.method isEqualToString:@"toNativePush"]) {
                    ThirdViewController *testVC = [[ThirdViewController alloc] init];
                    testVC.parames = call.arguments;
                    [weakSelf.navigationController pushViewController:testVC animated:YES];
                } else if ([call.method isEqualToString:@"toNativePop"]) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }];
        
        [self.navigationController pushViewController:flutterViewController animated:YES];
    }

    
    - (void)pushFlutterViewController_EventChannel {
        FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
        flutterViewController.navigationItem.title = @"EventChannel Demo";
        // 要与main.dart中一致
        NSString *channelName = @"com.pages.your/native_post";
        
        FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController];
        // 代理
        [evenChannal setStreamHandler:self];
        
        [self.navigationController pushViewController:flutterViewController animated:YES];
    }

#pragma mark - <FlutterStreamHandler>
    // // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
    - (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                           eventSink:(FlutterEventSink)events {
        
        // arguments flutter给native的参数
        // 回调给flutter
        if (events) {
            events(@"我是标题");
        }
        return nil;
    }
    
    /// flutter不再接收
    - (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
        // arguments flutter给native的参数
        return nil;
    }
    
@end
