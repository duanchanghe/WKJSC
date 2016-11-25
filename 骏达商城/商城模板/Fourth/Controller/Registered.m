//
//  Registered.m
//  商城模板
//
//  Created by kura on 2016/11/22.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "Registered.h"

@interface Registered ()

@end

@implementation Registered

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"手机号注册";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //输入框
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 300/320, SCREEN_WIDTH * 40/320)];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.placeholder = @"请输入11位有效手机号码";
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, _textField.frame.size.height)];
    _textField.leftView = leftView;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_textField];
    
    //下一步
    _next = [[UIButton alloc]initWithFrame:CGRectMake(_textField.frame.origin.x, CGRectGetMaxY(_textField.frame) + SCREEN_WIDTH * 10/320, _textField.frame.size.width, SCREEN_WIDTH * 35/320)];
    _next.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    [_next setTitle:@"下一步" forState:UIControlStateNormal];
    [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_next addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_next];
}

- (void)goNext {
    //给出内容判断
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[RegisteredTwo alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
