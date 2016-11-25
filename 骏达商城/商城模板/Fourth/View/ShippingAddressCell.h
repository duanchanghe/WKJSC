//
//  ShippingAddressCell.h
//  Legends of the campus
//
//  Created by kura on 16/8/9.
//  Copyright © 2016年 kura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"

@interface ShippingAddressCell : UITableViewCell

//收货人
@property (strong,nonatomic) UILabel * theConsignee;
//联系方式
@property (strong,nonatomic) UILabel * contacts;
//收货地址
@property (strong,nonatomic) UILabel * shippingAddress;
//设为默认按钮
@property (strong,nonatomic) UIButton * setToTheDefault;
@property (strong,nonatomic) void(^setDefault)();
//默认前面图片
@property (strong,nonatomic) UIImageView * leftImage;

//编辑
@property (strong,nonatomic) UIButton * editOperation;
@property (strong,nonatomic) void(^edited)();

//删除
@property (strong,nonatomic) UIButton * deleteOperation;
@property (strong,nonatomic) void(^deleted)();

@end
