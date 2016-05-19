//
//  VerifyTradePasswordView.h
//  DDTG
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 翟玉磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VerifyTradePasswordViewDelegate <NSObject>

- (void)verifyTradePasswordRequest:(NSString*)password;

@end

@interface VerifyTradePasswordView : UIView

@property (nonatomic, weak)id<VerifyTradePasswordViewDelegate> delegate;

- (void)updateView:(NSInteger)status;

@end
