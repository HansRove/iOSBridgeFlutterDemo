//
//  SecondViewController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "SecondViewController.h"
#import <Flutter/Flutter.h>

@interface SecondViewController ()<FlutterStreamHandler>
    
    @property (nonatomic,copy) FlutterEventSink callBack;
    @property (nonatomic,assign) NSInteger count;

@end

@implementation SecondViewController
    {
        FlutterViewController *_flutterViewController;
        ;
    }
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 888887;
    
    self.navigationItem.title = @"第二tab";
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, 350)];
    containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:containerView];
    
    _flutterViewController = [[FlutterViewController alloc] init];
    [_flutterViewController setInitialRoute:@"setting"];
    
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:@"com.second.your/native_post" binaryMessenger:_flutterViewController];
    [evenChannal setStreamHandler:self];
    
    [self addChildViewController:_flutterViewController];
    [containerView addSubview:_flutterViewController.view];
    _flutterViewController.view.frame = containerView.bounds;
    [_flutterViewController didMoveToParentViewController:self];
    
    
    UIButton *pushButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view  addSubview:pushButton];
    pushButton.frame = CGRectMake(0, 500, 320, 50);
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton setTitle:@"native变量加1" forState:(UIControlStateNormal)];
    [pushButton addTarget:self action:@selector(addFlutterCount) forControlEvents:(UIControlEventTouchUpInside)];
}

    - (void)addFlutterCount {
        self.count += 1;
        if (self.callBack) {
            self.callBack(@(self.count));
        }
    }
    
#pragma mark - <FlutterStreamHandler>
    // // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
    - (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                           eventSink:(FlutterEventSink)events {
        self.callBack = events;
        if (events) {
            events(@1234);
        }
        return nil;
    }
    
    /// flutter不再接收
    - (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
        return nil;
    }
    

@end
