//
//  EnterTheNewNumber.h
//  商城模板
//
//  Created by kura on 2016/11/17.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetVerificationCode.h"

@interface EnterTheNewNumber : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * currentTextField;
@property (nonatomic,strong) UITextField * avantTextField;
@property (nonatomic,strong) UIButton * next;

@end
