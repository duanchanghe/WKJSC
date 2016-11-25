//
//  RegisteredTwo.h
//  商城模板
//
//  Created by kura on 2016/11/22.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteredTwo : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * validationCode;

@property (nonatomic,strong) UIButton * getCode;
@property (nonatomic,strong) UILabel * getCodeLabel;

@property (nonatomic,strong) UITextField * passWord;
@property (nonatomic,strong) UITextField * passWordAgain;

@property (nonatomic,strong) UILabel * prompt;

@property (nonatomic,strong) UIButton * sure;

@end
