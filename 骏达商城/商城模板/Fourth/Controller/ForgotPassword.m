//
//  ForgotPassword.m
//  商城模板
//
//  Created by kura on 2016/11/22.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ForgotPassword.h"

@interface ForgotPassword ()

@end

@implementation ForgotPassword

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"找回密码";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //手机号输入框
    _phoneNumberBox = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 300/320, SCREEN_WIDTH * 40/320)];
    _phoneNumberBox.backgroundColor = [UIColor whiteColor];
    _phoneNumberBox.clearButtonMode = UITextFieldViewModeAlways;
    _phoneNumberBox.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNumberBox.placeholder = @"请输入手机号";
    UIView * leftViewOne = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _phoneNumberBox.leftView = leftViewOne;
    _phoneNumberBox.leftViewMode = UITextFieldViewModeAlways;
    _phoneNumberBox.delegate = self;
    [self.view addSubview:_phoneNumberBox];
    
    UILabel * labelOne = [[UILabel alloc]initWithFrame:CGRectMake(_phoneNumberBox.frame.origin.x, CGRectGetMaxY(_phoneNumberBox.frame) - 1, _phoneNumberBox.frame.size.width, 1)];
    labelOne.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:labelOne];
    
    //验证码输入框
    _captchaInputBox = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumberBox.frame.origin.x, CGRectGetMaxY(_phoneNumberBox.frame), _phoneNumberBox.frame.size.width, _phoneNumberBox.frame.size.height)];
    _captchaInputBox.backgroundColor = [UIColor whiteColor];
    _captchaInputBox.clearButtonMode = UITextFieldViewModeAlways;
    _captchaInputBox.placeholder = @"请输入验证码";
    UIView * leftViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _captchaInputBox.leftView = leftViewTwo;
    _captchaInputBox.leftViewMode = UITextFieldViewModeAlways;
    _captchaInputBox.delegate = self;
    [self.view addSubview:_captchaInputBox];

    UILabel * labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(_captchaInputBox.frame.origin.x, CGRectGetMaxY(_captchaInputBox.frame) - 1, _captchaInputBox.frame.size.width, 1)];
    labelTwo.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:labelTwo];
    
    //点击获取验证码
    _getCode = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 240/320, _captchaInputBox.frame.origin.y, SCREEN_WIDTH * 70/320, _captchaInputBox.frame.size.height)];
    [_getCode addTarget:self action:@selector(getCodeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getCode];
    
    _getCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 40/320)];
    _getCodeLabel.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    _getCodeLabel.textAlignment = NSTextAlignmentCenter;
    _getCodeLabel.font = [UIFont systemFontOfSize:14.0f];
    _getCodeLabel.textColor = [UIColor whiteColor];
    _getCodeLabel.text = @"获取验证码";
    _getCodeLabel.layer.cornerRadius = SCREEN_WIDTH * 3/320;
    [_getCode addSubview:_getCodeLabel];
    
    //新密码输入框
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(_captchaInputBox.frame.origin.x, CGRectGetMaxY(_captchaInputBox.frame), _captchaInputBox.frame.size.width, _captchaInputBox.frame.size.height)];
    _passWord.backgroundColor = [UIColor whiteColor];
    _passWord.clearButtonMode = UITextFieldViewModeAlways;
    _passWord.placeholder = @"请输入新密码";
    UIView * leftViewThree = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _passWord.leftView = leftViewThree;
    _passWord.leftViewMode = UITextFieldViewModeAlways;
    _passWord.delegate = self;
    [self.view addSubview:_passWord];
    
    UILabel * labelThree = [[UILabel alloc]initWithFrame:CGRectMake(_passWord.frame.origin.x, CGRectGetMaxY(_passWord.frame) - 1, _passWord.frame.size.width, 1)];
    labelThree.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:labelThree];
    
    //再次输入新密码
    _passWordAgain = [[UITextField alloc]initWithFrame:CGRectMake(_passWord.frame.origin.x, CGRectGetMaxY(_passWord.frame), _passWord.frame.size.width, _passWord.frame.size.height)];
    _passWordAgain.backgroundColor = [UIColor whiteColor];
    _passWordAgain.clearButtonMode = UITextFieldViewModeAlways;
    _passWordAgain.placeholder = @"请再次输入新密码";
    UIView * leftViewFour = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _passWordAgain.leftView = leftViewFour;
    _passWordAgain.leftViewMode = UITextFieldViewModeAlways;
    _passWordAgain.delegate = self;
    [self.view addSubview:_passWordAgain];
    
    //确定
    _sure = [[UIButton alloc]initWithFrame:CGRectMake(_passWordAgain.frame.origin.x, CGRectGetMaxY(_passWordAgain.frame) + SCREEN_WIDTH * 10/320, _passWordAgain.frame.size.width, _passWordAgain.frame.size.height)];
    _sure.backgroundColor = [UIColor colorWithRed:0.961 green:0.459 blue:0.357 alpha:1.00];
    [_sure setTitle:@"确定" forState:UIControlStateNormal];
    [_sure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sure addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sure];

}

//获取验证码
- (void)getCodeAction {
   
        //计时器启动
        [self performSelector:@selector(changeTime:) withObject:[NSNumber numberWithInt:60] afterDelay:0];
        //接口请求验证码

}

- (void)changeTime:(NSNumber*)second {
    if ([second integerValue] == 0) {
        [_getCodeLabel setBackgroundColor:[UIColor colorWithRed:0.753 green:0.753 blue:0.753 alpha:1.00]];
        _getCodeLabel.text = @"重新获取";
        _getCodeLabel.font = [UIFont systemFontOfSize:14.0f];
    }else {
        [_getCodeLabel setBackgroundColor:[UIColor colorWithRed:0.753 green:0.753 blue:0.753 alpha:1.00]];
        int i = [second intValue];
        _getCodeLabel.font = [UIFont systemFontOfSize:12.0f];
        _getCodeLabel.text = [NSString stringWithFormat:@"重新发送(%i)",i];
        [self performSelector:@selector(changeTime:) withObject:[NSNumber numberWithInt:i - 1] afterDelay:1];
    }
}


//确定
- (void)sureAction {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
