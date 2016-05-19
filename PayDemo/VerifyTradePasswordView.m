//
//  VerifyTradePasswordView.m
//  DDTG
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 翟玉磊. All rights reserved.
//

#import "VerifyTradePasswordView.h"
#import "VerifyPasswordKeyBoard.h"
#import "VerifyPasswordInputView.h"
#import "Masonry.h"

@interface VerifyTradePasswordView () <VerifyPasswordInputViewDelegate>

@property (nonatomic, strong)UILabel* titleLabel;
@property (nonatomic, strong)UILabel* infoLabel;
@property (nonatomic, strong)VerifyPasswordKeyBoard* verifyKeyBoard;
@property (nonatomic, strong)VerifyPasswordInputView* verifyInputView;

@end

@implementation VerifyTradePasswordView{
    NSInteger verifyStatus;
    NSString* verifyPassword;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor whiteColor];
    verifyStatus = 0;
    
    [self addSubview:self.verifyKeyBoard];
    [self addSubview:self.verifyInputView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.infoLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(16);
    }];
    [self.verifyInputView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.and.right.equalTo(self);
        make.height.mas_equalTo(50);
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.verifyInputView.mas_bottom).offset(5);
        make.left.mas_equalTo(16);
    }];
    [self.verifyKeyBoard mas_makeConstraints:^(MASConstraintMaker* make){
        make.bottom.and.left.and.right.equalTo(self);
        make.height.mas_equalTo(180);
    }];
}

- (void)updateView:(NSInteger)status{
    switch (status) {
        case 0:
            self.titleLabel.text = @"请输入六位原始交易密码";
            break;
            
        case 1:
            self.titleLabel.text = @"请设置六位交易密码";
            break;
            
        case 2:
            self.titleLabel.text = @"请再次输入六位交易密码";
            break;
            
        default:
            break;
    }
}

#pragma Delegate

- (void)verifyPassword:(NSString *)password{
    verifyPassword = password;
    if (verifyPassword.length == 6) {
        [self.delegate verifyTradePasswordRequest:verifyPassword];
    }
}

#pragma Getter/Setter

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"请输入六位原始交易密码";
    }
    return _titleLabel;
}

- (VerifyPasswordInputView *)verifyInputView{
    if (_verifyInputView == nil) {
        _verifyInputView = [VerifyPasswordInputView new];
        _verifyInputView.delegate = self;
    }
    return _verifyInputView;
}

- (UILabel *)infoLabel{
    if (_infoLabel == nil) {
        _infoLabel = [UILabel new];
        _infoLabel.textColor = [UIColor grayColor];
        _infoLabel.font = [UIFont systemFontOfSize:12];
        _infoLabel.text = @"6位数字，建议使用不同于银行卡密码的数字组合";
    }
    return _infoLabel;
}

- (VerifyPasswordKeyBoard *)verifyKeyBoard{
    if (_verifyKeyBoard == nil) {
        _verifyKeyBoard = [VerifyPasswordKeyBoard new];
    }
    return _verifyKeyBoard;
}

@end
