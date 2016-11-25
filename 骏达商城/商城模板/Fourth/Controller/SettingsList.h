//
//  SettingsList.h
//  商城模板
//
//  Created by kura on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"
#import <MJRefresh.h>
#import "EnterTheNewNumber.h"
#import "ShippingAddressVC.h"
#import "ChangesPassWord.h"

@interface SettingsList : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray * titleArray;

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,retain) UIImageView * headPortrait;
@property (nonatomic,strong) UILabel * nickName;
@property (nonatomic,strong) UITextField * nickNameInput;
@property (nonatomic,strong) UILabel * phoneNumber;
@property (nonatomic,strong) UITextField * phoneNumberInput;

@end
