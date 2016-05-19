//
//  VerifyPasswordInputView.m
//  DDTG
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 翟玉磊. All rights reserved.
//

#import "VerifyPasswordInputView.h"
#import "VerifyPasswordKeyBoard.h"

#define KApplicationSize [[UIScreen mainScreen] bounds].size

@implementation VerifyPasswordInputView{
    NSMutableArray* nums;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor clearColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getInputNumNotification:) name:kVerifyPasswordKeyBoardNotification object:nil];
    
    nums = [NSMutableArray array];
    
}

- (void)drawRect:(CGRect)rect{
    UIImage* inputField = [UIImage imageNamed:@"trade.bundle/password_in"];
    CGRect frame = CGRectMake(15, 0, KApplicationSize.width - 30, 50);
    [inputField drawInRect:frame];
    
    UIImage* pointImage = [UIImage imageNamed:@"trade.bundle/yuan"];
    CGFloat width = frame.size.width / 6;
    CGFloat pointWidth = KApplicationSize.width * 0.05;
    CGFloat x = frame.origin.x + (width - pointWidth) / 2;
    CGFloat y = frame.origin.y + (frame.size.height - pointWidth) / 2;
    for (int i = 0; i < nums.count; i++) {
        [pointImage drawInRect:CGRectMake(x, y, pointWidth, pointWidth)];
        x += width;
    }
}

#pragma Action

- (void)getInputNumNotification:(NSNotification*)notification{
    
    NSInteger num = [notification.userInfo[@"num"] integerValue];
    if (num == 12) {
        [nums removeLastObject];
        [self setNeedsDisplay];
        return ;
    }
    
    [nums addObject:notification.userInfo[@"num"]];
    [self setNeedsDisplay];
    
    if ([nums count] == 6) {
        NSMutableString* str = [NSMutableString new];
        for (NSNumber* num in nums) {
            [str appendFormat:@"%@", num];
        }
        if ([self.delegate respondsToSelector:@selector(verifyPassword:)]) {
            NSLog(@"密码：%@", str);
            [self.delegate verifyPassword:[str copy]];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [nums removeAllObjects];
            [self setNeedsDisplay];
        });
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
