//
//  CitysSelectedVC.m
//  骏达暖通
//
//  Created by kura on 2016/10/13.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "CitysSelectedVC.h"

@interface CitysSelectedVC ()

{
    NSArray * array1;
    NSArray * array2;
    NSArray * array3;
    NSArray * array4;
    NSArray * array5;
}

@end

@implementation CitysSelectedVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = FirstPageNavColor;
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //右边搜索按钮
    _rightBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 40/320, SCREEN_WIDTH * 40/320)];
    [_rightBarButton setImage:[UIImage imageNamed:@"serach"] forState:UIControlStateNormal];
    [_rightBarButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBarButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //输入搜索
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 280/320, SCREEN_WIDTH * 25/320)];
    _textField.backgroundColor = [UIColor colorWithRed:0.827 green:0.184 blue:0.086 alpha:1.00];
    _textField.placeholder = @"输入您所在的城市";
    [_textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _textField.textColor = [UIColor whiteColor];
    _textField.layer.masksToBounds = YES;
    _textField.layer.cornerRadius = 12.5f;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.delegate = self;
    
    UIView * textFieldLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 5/320, _textField.frame.size.height)];
    textFieldLeftView.backgroundColor = [UIColor clearColor];
    _textField.leftView = textFieldLeftView;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    
    self.navigationItem.titleView = _textField;
    
    [self initTableView];
}

- (void)initTableView {
   
    array1 = @[@"北京市",@"保定市",@"太原市",@"长春市",@"大庆市",@"济南市",@"青岛市",@"淄博市",@"聊城市",@"日照市",@"济宁市"];
    array2 = @[@"上海市",@"徐州市",@"连云港市",@"赣榆市",@"淮安市",@"宿迁市",@"扬州市",@"常州市",@"无锡市",@"苏州市",@"合肥市",@"岳西市",@"宁波市",@"杭州市",@"嘉兴市",@"湖州市",@"绍兴市"];
    array3 = @[@"莆田市",@"长沙市",@"宁乡市",@"衡阳市",@"怀化市",@"广州市",@"深圳市",@"惠州市",@"南宁市"];
    array4 = @[@"登封市",@"洛阳市",@"焦作市",@"许昌市",@"信阳市",@"济源市",@"武汉市",@"宜昌市",@"荆门市",@"萍乡市",@"丰城市"];
    array5 = @[@"重庆市",@"成都市",@"自贡市",@"绵阳市",@"德阳市",@"遂宁市",@"南充市",@"达州市",@"贵阳市",@"六盘水市",@"遵义市",@"昆明市"];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   //[self.view addSubview:_tableView];
    self.view = _tableView;
    
    UIView * footerView = [[UIView alloc]init];
    footerView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = footerView;
}

#pragma maek -- UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder];
    return YES;
}

#pragma mark -- 搜素按钮
- (void)search:(UIButton*)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return array1.count;
    }else if (section == 1) {
        return array2.count;
    }else if (section == 2) {
        return array3.count;
    }else if (section == 3) {
        return array4.count;
    }else {
        return array5.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SCREEN_WIDTH * 30/320;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 30/320)];
    label.font = [UIFont systemFontOfSize:17.0f];
    if (section == 0) {
        label.text = @" 华北地区";
    }else if (section == 1) {
        label.text = @" 华东地区";
    }else if (section == 2) {
        label.text = @" 华南地区";
    }else if (section == 3) {
        label.text = @" 华中地区";
    }else {
        label.text = @" 西南地区";
    }
    return label;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identify = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.textColor = [UIColor colorWithRed:0.643 green:0.643 blue:0.643 alpha:1.00];
   
    if (indexPath.section == 0) {
        cell.textLabel.text = [array1 objectAtIndex:indexPath.row];
    }else if (indexPath.section == 1) {
        cell.textLabel.text = [array2 objectAtIndex:indexPath.row];
    }else if (indexPath.section == 2) {
        cell.textLabel.text = [array3 objectAtIndex:indexPath.row];
    }else if (indexPath.section == 3) {
        cell.textLabel.text = [array4 objectAtIndex:indexPath.row];
    }else {
        cell.textLabel.text = [array5 objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.navigationController popViewControllerAnimated:YES];
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
