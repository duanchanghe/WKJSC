//
//  SettingsList.m
//  商城模板
//
//  Created by kura on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "SettingsList.h"

@interface SettingsList ()

@end

@implementation SettingsList

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"设置";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = [NSArray arrayWithObjects:@"头像",@"昵称",@"手机号",@"收货地址",@"修改密码", nil];
    [self setTableView:_tableView];
}

- (void)setTableView:(UITableView *)tableView {
    tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    tableView.tableFooterView = view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return SCREEN_WIDTH * 60/320;
    }else {
        return SCREEN_WIDTH * 44/320;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        
        //头像
        _headPortrait = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 40/320, SCREEN_WIDTH * 40/320)];
        _headPortrait.layer.masksToBounds = YES;
        _headPortrait.layer.cornerRadius = _headPortrait.frame.size.width/2;
        _headPortrait.image = [UIImage imageNamed:@"headpot"];
        cell.accessoryView = _headPortrait;
        
    }else if (indexPath.row == 1) {
        
        //昵称
        _nickName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 40/320, SCREEN_WIDTH * 40/320)];
        _nickName.textAlignment = NSTextAlignmentRight;
        _nickName.textColor = [UIColor colorWithRed:0.824 green:0.824 blue:0.839 alpha:1.00];
        _nickName.text = @"程超";
        cell.accessoryView = _nickName;
        
    }else if (indexPath.row == 2) {
        
        //手机号
        _phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 40/320)];
        _phoneNumber.textAlignment = NSTextAlignmentRight;
        _phoneNumber.textColor = [UIColor colorWithRed:0.824 green:0.824 blue:0.839 alpha:1.00];
        _phoneNumber.text = @"15629156212";
        cell.accessoryView = _phoneNumber;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
        //头像更换选择
        [self HeadToChoose];
    }else if (indexPath.row == 1) {
        //昵称
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:@"请输入昵称" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入昵称";
            _nickNameInput = textField;
        }];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else if (indexPath.row == 2) {
        //手机号
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:[[EnterTheNewNumber alloc]init] animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    }else if (indexPath.row == 3) {
        //收货地址
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:[[ShippingAddressVC alloc]init] animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else {
        //修改密码
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:[[ChangesPassWord alloc]init] animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

//头像选取
- (void)HeadToChoose {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //调用系统相机
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //调用系统相册
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
