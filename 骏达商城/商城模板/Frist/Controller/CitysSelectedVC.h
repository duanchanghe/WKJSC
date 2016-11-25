//
//  CitysSelectedVC.h
//  骏达暖通
//
//  Created by kura on 2016/10/13.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

//导航栏颜色
#define FirstPageNavColor [UIColor colorWithRed:0.976 green:0.369 blue:0.200 alpha:1.00]

@interface CitysSelectedVC : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITextField * textField;
@property (nonatomic,strong) UIButton * rightBarButton;

@property (nonatomic,strong) UITableView * tableView;

@end
