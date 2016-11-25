//
//  ForgotPassword.h
//  商城模板
//
//  Created by kura on 2016/11/22.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassword : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * phoneNumberBox;
@property (nonatomic,strong) UIButton * getCode;
@property (nonatomic,strong) UILabel * getCodeLabel;

@property (nonatomic,strong) UITextField * captchaInputBox;

@property (nonatomic,strong) UITextField * passWord;

@property (nonatomic,strong) UITextField * passWordAgain;

@property (nonatomic,strong) UIButton * sure;

@end
