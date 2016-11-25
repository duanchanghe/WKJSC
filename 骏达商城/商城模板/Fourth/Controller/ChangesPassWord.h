//
//  ChangesPassWord.h
//  商城模板
//
//  Created by kura on 2016/11/21.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangesPassWord : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * originallyPassWord;
@property (nonatomic,strong) UITextField * theOldPassWord;
@property (nonatomic,strong) UITextField * theNewPassWord;

@property (nonatomic,strong) UIButton * next;

@end
