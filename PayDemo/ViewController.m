//
//  ViewController.m
//  PayDemo
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "ViewController.h"
#import "VerifyTradePasswordView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController{
    VerifyTradePasswordView* verifyTradePasswordView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    verifyTradePasswordView = [VerifyTradePasswordView new];
    [self.view addSubview:verifyTradePasswordView];
    
    [verifyTradePasswordView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.mas_equalTo(64);
        make.left.and.right.and.bottom.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
