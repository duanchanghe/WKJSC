//
//  TheLoginVC.h
//  商城模板
//
//  Created by kura on 2016/11/21.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Registered.h"
#import "ForgotPassword.h"

@interface TheLoginVC : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * phoneNumberInput;

@property (nonatomic,strong) UITextField * passWordInput;

@property (nonatomic,strong) UIButton * login;

@property (nonatomic,strong) UIButton * registered;

@property (nonatomic,strong) UIButton * forgotPassword;

@end
