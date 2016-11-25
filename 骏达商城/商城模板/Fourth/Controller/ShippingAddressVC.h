//
//  ShippingAddressVC.h
//  商城模板
//
//  Created by kura on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressCell.h"
#import "EditingAddress.h"

@interface ShippingAddressVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,retain) NSMutableArray * nameArray;
@property (nonatomic,retain) NSMutableArray * contactArray;
@property (nonatomic,retain) NSMutableArray * addressArray;

@property (nonatomic,retain) UIView * headerView;
@property (nonatomic,strong) UIButton * goToAddAddress;

@property (nonatomic,retain) UIView * footerView;

@end
