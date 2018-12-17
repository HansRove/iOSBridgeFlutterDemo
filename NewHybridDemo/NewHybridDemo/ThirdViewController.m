//
//  ThirdViewController.m
//  iOSBridgeFlutterDemo
//
//  Created by Zer0 on 2018/9/28.
//  Copyright © 2018年 Zer0. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    self.navigationItem.title = @"第三page";
    
    NSString *text = [self.parames objectForKey:@"title"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 300, 100)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:25];
    label.text = text;
    [self.view addSubview:label];
    
}

- (void)dealloc {
    NSLog(@"%@   释放了",NSStringFromClass([self class]));
}

@end
