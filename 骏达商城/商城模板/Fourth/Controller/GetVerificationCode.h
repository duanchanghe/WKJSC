//
//  GetVerificationCode.h
//  商城模板
//
//  Created by kura on 2016/11/17.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"

@interface GetVerificationCode : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * textField;

@property (nonatomic,strong) UIButton * getCode;
@property (nonatomic,strong) UILabel * getCodeLabel;

@property (nonatomic,copy) NSString * tipContent;
@property (nonatomic,strong) UILabel * tipLabel;

@property (nonatomic,strong) UIButton * next;

@end
