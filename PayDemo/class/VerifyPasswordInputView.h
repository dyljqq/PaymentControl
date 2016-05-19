//
//  VerifyPasswordInputView.h
//  DDTG
//
//  Created by 季勤强 on 16/5/19.
//  Copyright © 2016年 翟玉磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VerifyPasswordInputViewDelegate <NSObject>

- (void)verifyPassword:(NSString*)password;

@end

@interface VerifyPasswordInputView : UIView

@property (nonatomic, weak)id<VerifyPasswordInputViewDelegate> delegate;

@end
