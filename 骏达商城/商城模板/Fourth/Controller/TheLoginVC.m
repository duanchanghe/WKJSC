//
//  TheLoginVC.m
//  商城模板
//
//  Created by kura on 2016/11/21.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "TheLoginVC.h"

@interface TheLoginVC ()

@end

@implementation TheLoginVC

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"登录";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //手机号
    _phoneNumberInput = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 65/320, SCREEN_WIDTH * 300/320, SCREEN_WIDTH * 40/320)];
    _phoneNumberInput.backgroundColor = [UIColor whiteColor];
    _phoneNumberInput.placeholder = @"手机号";
    _phoneNumberInput.textAlignment = NSTextAlignmentLeft;
    _phoneNumberInput.clearButtonMode = UITextFieldViewModeAlways;
    _phoneNumberInput.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNumberInput.delegate = self;
    
    UIView * leftView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 10/320, _phoneNumberInput.frame.size.height)];
    _phoneNumberInput.leftView = leftView1;
    _phoneNumberInput.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_phoneNumberInput];
    
    //分割
    UILabel * segmentation = [[UILabel alloc]initWithFrame:CGRectMake(_phoneNumberInput.frame.origin.x, CGRectGetMaxY(_phoneNumberInput.frame) - 1, _phoneNumberInput.frame.size.width, _phoneNumberInput.frame.size.height)];
    segmentation.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    [self.view addSubview:segmentation];
    
    //密码输入
    _passWordInput = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumberInput.frame.origin.x, CGRectGetMaxY(_phoneNumberInput.frame), _phoneNumberInput.frame.size.width, _phoneNumberInput.frame.size.height)];
    _passWordInput.backgroundColor = [UIColor whiteColor];
    _passWordInput.placeholder = @"密码";
    _passWordInput.textAlignment = NSTextAlignmentLeft;
    _passWordInput.clearButtonMode = UITextFieldViewModeAlways;
    _passWordInput.delegate = self;
    
    UIView * leftView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 10/320, _passWordInput.frame.size.height)];
    _passWordInput.leftView = leftView2;
    _passWordInput.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_passWordInput];
    
    //登录
    _login = [[UIButton alloc]initWithFrame:CGRectMake(_passWordInput.frame.origin.x, CGRectGetMaxY(_passWordInput.frame) + SCREEN_WIDTH * 20/320, _passWordInput.frame.size.width, SCREEN_WIDTH * 40/320)];
    _login.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    [_login setTitle:@"登 录" forState:UIControlStateNormal];
    [_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_login addTarget:self action:@selector(loginIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_login];
    
    //忘记密码
    _forgotPassword = [[UIButton alloc]initWithFrame:CGRectMake(_login.frame.origin.x, CGRectGetMaxY(_login.frame) + SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 30/320)];
    _forgotPassword.backgroundColor = [UIColor clearColor];
    [_forgotPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgotPassword setTitleColor:[UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00] forState:UIControlStateNormal];
    [_forgotPassword addTarget:self action:@selector(forgetPassWord) forControlEvents:UIControlEventTouchUpInside];
    _forgotPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:_forgotPassword];
    
    //立即注册
    _registered = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_login.frame) - SCREEN_WIDTH * 100/320, CGRectGetMaxY(_login.frame) + SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 30/320)];
    _registered.backgroundColor = [UIColor clearColor];
    [_registered setTitle:@"立即注册" forState:UIControlStateNormal];
    [_registered setTitleColor:[UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00] forState:UIControlStateNormal];
    [_registered addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    _registered.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:_registered];
}

//登录
- (void)loginIn {
    
}

//忘记密码
- (void)forgetPassWord {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[ForgotPassword alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//立即注册
- (void)registerAction {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[Registered alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_phoneNumberInput resignFirstResponder];
    [_passWordInput resignFirstResponder];
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
