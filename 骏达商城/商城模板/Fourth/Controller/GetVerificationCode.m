//
//  GetVerificationCode.m
//  商城模板
//
//  Created by kura on 2016/11/17.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "GetVerificationCode.h"

@interface GetVerificationCode ()

@end

@implementation GetVerificationCode

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"更换手机号";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //验证码输入框
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH * 75/320, SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.placeholder = @"请输入验证码";
    _textField.textAlignment = NSTextAlignmentLeft;
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField.leftView = leftView;
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    //点击获取验证码
    _getCode = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 240/320, SCREEN_WIDTH * 75/320, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 50/320)];
    _getCode.backgroundColor = [UIColor clearColor];
    [_getCode addTarget:self action:@selector(getCodeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getCode];
    
    _getCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 40/320)];
    _getCodeLabel.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    _getCodeLabel.textAlignment = NSTextAlignmentCenter;
    _getCodeLabel.font = [UIFont systemFontOfSize:14.0f];
    _getCodeLabel.textColor = [UIColor whiteColor];
    _getCodeLabel.text = @"重新获取";
    _getCodeLabel.layer.cornerRadius = SCREEN_WIDTH * 3/320;
    [_getCode addSubview:_getCodeLabel];
    
    //提示已经发送
    _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_textField.frame) + SCREEN_WIDTH * 15/320, SCREEN_WIDTH, SCREEN_WIDTH * 20/320)];
    _tipLabel.backgroundColor = [UIColor clearColor];
    _tipLabel.textColor = [UIColor colorWithRed:0.753 green:0.753 blue:0.753 alpha:1.00];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.text = [NSString stringWithFormat:@"%@%@%@",@"已向手机号",_tipContent,@"发送验证码"];
    [self.view addSubview:_tipLabel];
    
    //下一步
    _next = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 20/320, CGRectGetMaxY(_tipLabel.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 280/320, SCREEN_WIDTH * 40/320)];
    _next.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    [_next setTitle:@"下一步" forState:UIControlStateNormal];
    [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_next addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_next];
}

- (void)textFieldDidChange:(UITextField*)textField {
    if ((textField = self.textField)) {
        if (textField.text.length > 4) {
            textField.text = [textField.text substringToIndex:4];
        }
    }
}

//获取验证码
- (void)getCodeAction {
    if (_textField.text.length == 0 || _textField.text.length < 4) {
        //验证码格式不对
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码码格式不正确" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }else {
        //计时器启动
        [self performSelector:@selector(changeTime:) withObject:[NSNumber numberWithInt:60] afterDelay:0];
        //接口请求验证码
    }
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

//请求接口修改
- (void)goNext {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
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
