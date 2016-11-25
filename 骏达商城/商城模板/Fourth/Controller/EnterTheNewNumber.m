//
//  EnterTheNewNumber.m
//  商城模板
//
//  Created by kura on 2016/11/17.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "EnterTheNewNumber.h"

@interface EnterTheNewNumber ()

@end

@implementation EnterTheNewNumber

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"更换手机号";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //提示语
    UILabel * tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH * 50/320, SCREEN_WIDTH, SCREEN_WIDTH * 60/320)];
    tipLabel.text = @"更换绑定的手机号\n之后可以用新手机号及当前密码登录";
    tipLabel.numberOfLines = 0;
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor colorWithRed:0.400 green:0.400 blue:0.400 alpha:1.00];
    [self.view addSubview:tipLabel];
    
    _currentTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tipLabel.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _currentTextField.placeholder = @"请输入当前绑定的手机号";
    _currentTextField.delegate = self;
    _currentTextField.backgroundColor = [UIColor whiteColor];
    _currentTextField.textAlignment = NSTextAlignmentLeft;;
    _currentTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _currentTextField.keyboardType = UIKeyboardTypeNumberPad;
    [_currentTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, tipLabel.frame.size.height)];
    _currentTextField.leftView = leftView;
    _currentTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_currentTextField];
    
    //分割
    UILabel * divider = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_currentTextField.frame) - SCREEN_WIDTH * 0.5/320, SCREEN_WIDTH, SCREEN_WIDTH * 1/320)];
    divider.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:divider];
    
    _avantTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_currentTextField.frame), SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _avantTextField.placeholder = @"请输入新手机号码";
    _avantTextField.delegate = self;
    _avantTextField.backgroundColor = [UIColor whiteColor];
    _avantTextField.textAlignment = NSTextAlignmentLeft;
    _avantTextField.clearButtonMode = UITextFieldViewModeAlways;
    _avantTextField.keyboardType = UIKeyboardTypeNumberPad;
     [_avantTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIView * leftView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, tipLabel.frame.size.height)];
    _avantTextField.leftView = leftView1;
    _avantTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_avantTextField];
    
    //下一步
    _next = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 20/320, CGRectGetMaxY(_avantTextField.frame) + SCREEN_WIDTH * 20/320, SCREEN_WIDTH * 280/320, SCREEN_WIDTH * 40/320)];
    _next.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    [_next setTitle:@"下一步" forState:UIControlStateNormal];
    [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_next addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_next];
}

//限制输入长度
- (void)textFieldDidChange:(UITextField*)textField {
    if (textField == self.currentTextField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }else if (textField == self.avantTextField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }
}

//下一步
- (void)goNext {
   
    GetVerificationCode * getCode = [[GetVerificationCode alloc]init];
    
     //判断内容
    if (_currentTextField.text.length == 0 || _currentTextField.text.length < 11 || _avantTextField.text.length == 0 || _avantTextField.text.length < 11) {
        //手机号码格式不对
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号码格式不正确" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }else {
        
        getCode.tipContent = _avantTextField.text;
        
        [self.navigationController pushViewController:getCode animated:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_currentTextField resignFirstResponder];
    [_avantTextField resignFirstResponder];
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
