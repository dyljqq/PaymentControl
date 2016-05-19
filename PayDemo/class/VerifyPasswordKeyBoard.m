//
//  VerifyPasswordKeyBoard.m
//  DDTG
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 翟玉磊. All rights reserved.
//

#import "VerifyPasswordKeyBoard.h"
#import "Masonry.h"

NSString* const kVerifyPasswordKeyBoardNotification = @"kVerifyPasswordKeyBoard";

static const CGFloat BUTTON_HEIGHT = 44.0;

@implementation VerifyPasswordKeyBoard

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    [self drawKeyBoard];
}

- (void)drawKeyBoard{
    UIButton* lastButton = nil;
    for (int i = 0; i < 12; i++) {
        UIButton* button = [UIButton new];
        if (i == 9) {
            button.userInteractionEnabled = NO;
        }
        [button setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        switch (i) {
            case 9:
                [button setTitle:@"" forState:UIControlStateNormal];
                break;
                
            case 10:
                [button setTitle:@"0" forState:UIControlStateNormal];
                break;
                
            case 11:
                [button setTitle:@"删除" forState:UIControlStateNormal];
                break;
                
            default:
                break;
        }
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.layer.borderWidth = 0.5;
        button.tag = i + 1;
        [button addTarget:self action:@selector(buttonDidtouch:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker* make){
            make.height.mas_equalTo(BUTTON_HEIGHT);
            make.width.equalTo(self).multipliedBy(0.334);
            if(lastButton == nil){
                make.top.and.left.equalTo(self);
            }else{
                if (i % 3 == 0) {
                    make.top.equalTo(lastButton.mas_bottom);
                    make.left.equalTo(self);
                }else{
                    make.top.equalTo(lastButton);
                    make.left.equalTo(lastButton.mas_right);
                }
            }
        }];
        
        lastButton = button;
    }
}

#pragma Action

- (void)buttonDidtouch:(UIButton*)button{
    NSInteger tag = button.tag;
    if(tag == 11){
        tag = 0;
    }
    NSLog(@"数字:%ld", tag);
    [[NSNotificationCenter defaultCenter] postNotificationName:kVerifyPasswordKeyBoardNotification object:nil userInfo:@{@"num": [NSNumber numberWithInteger:tag]}];
}

@end
