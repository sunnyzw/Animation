//
//  ViewController.m
//  MCAnimation
//
//  Created by xulu on 15/8/24.
//  Copyright (c) 2015年 _MC. All rights reserved.
//

#import "ViewController.h"
#import "MYButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MYButton * button = [MYButton buttonWithType:UIButtonTypeCustom initialFrame:CGRectMake(200, 200, 30, 30)];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    button.animationOptions = StretchDown;
    [self.view addSubview:button];
}


- (void)test {
    NSLog(@"ssss");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
