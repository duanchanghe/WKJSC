//
//  ChangesPassWord.m
//  商城模板
//
//  Created by kura on 2016/11/21.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ChangesPassWord.h"

@interface ChangesPassWord ()

@end

@implementation ChangesPassWord

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"修改密码";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _originallyPassWord = [[UITextField alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH * 70/320, SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _originallyPassWord.backgroundColor = [UIColor whiteColor];
    _originallyPassWord.placeholder = @"请输入原密码";
    _originallyPassWord.textAlignment = NSTextAlignmentLeft;
    _originallyPassWord.clearButtonMode = UITextFieldViewModeAlways;
    _originallyPassWord.delegate = self;
    
    UIView * LeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _originallyPassWord.leftView = LeftView;
    _originallyPassWord.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_originallyPassWord];
    
    //分割1
    UILabel * current1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_originallyPassWord.frame) - SCREEN_WIDTH * 1/320, SCREEN_WIDTH, SCREEN_WIDTH * 1/320)];
    current1.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:current1];
    
    _theOldPassWord = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_originallyPassWord.frame), SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _theOldPassWord.backgroundColor = [UIColor whiteColor];
    _theOldPassWord.placeholder = @"请输入新密码(6-20位英文或数字)";
    _theOldPassWord.textAlignment = NSTextAlignmentLeft;
    _theOldPassWord.clearButtonMode = UITextFieldViewModeAlways;
    _theOldPassWord.delegate = self;
    
    UIView * theOldLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _theOldPassWord.leftView = theOldLeftView;
    _theOldPassWord.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_theOldPassWord];
    
    //分割2
    UILabel * current2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_theOldPassWord.frame) - SCREEN_WIDTH * 1/320, SCREEN_WIDTH, SCREEN_WIDTH * 1/320)];
    current2.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [self.view addSubview:current2];
    
    _theNewPassWord = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_theOldPassWord.frame), SCREEN_WIDTH, SCREEN_WIDTH * 50/320)];
    _theNewPassWord.backgroundColor = [UIColor whiteColor];
    _theNewPassWord.placeholder = @"请再输入密码";
    _theNewPassWord.textAlignment = NSTextAlignmentLeft;
    _theNewPassWord.clearButtonMode = UITextFieldViewModeAlways;
    _theNewPassWord.delegate = self;
    
    UIView * theNewLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 40/320)];
    _theNewPassWord.leftView = theNewLeftView;
    _theNewPassWord.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_theNewPassWord];
    
    //下一步
    _next = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 20/320, CGRectGetMaxY(_theNewPassWord.frame) + SCREEN_WIDTH * 20/320, SCREEN_WIDTH * 280/320, SCREEN_WIDTH * 40/320)];
    _next.backgroundColor = [UIColor colorWithRed:0.969 green:0.459 blue:0.337 alpha:1.00];
    [_next setTitle:@"下一步" forState:UIControlStateNormal];
    [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_next addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_next];
}

//下一步action
- (void)goNext {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_originallyPassWord resignFirstResponder];
    [_theOldPassWord resignFirstResponder];
    [_theNewPassWord resignFirstResponder];
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
