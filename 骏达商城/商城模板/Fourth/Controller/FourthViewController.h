//
//  FourthViewController.h
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"
#import "FourthCell.h"
#import "Footprint.h"
#import "SettingsList.h"
#import "TheLoginVC.h"
#import "ToViewTheOrder.h"

@interface FourthViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

//设置
@property (nonatomic,strong) UIButton * settings;

//头像 昵称 余额
@property (nonatomic,strong) UIImageView * topView;
@property (nonatomic,strong) UIButton * headPortrait;
@property (nonatomic,strong) UILabel * nickName;
@property (nonatomic,strong) UILabel * myBalance;

//可用积分 可用优惠券 可用余额
@property (nonatomic,retain) UIView * displayView;
@property (nonatomic,strong) UILabel * points;
@property (nonatomic,strong) UILabel * coupon;
@property (nonatomic,strong) UILabel * balance;

//我的订单 查看全部订单
@property (nonatomic,retain) UIView * orders;
@property (nonatomic,strong) UIButton * checkOrders;
@property (nonatomic,strong) UILabel * myOrders;
@property (nonatomic,strong) UILabel * checkMyOrders;

//collectionView
@property (nonatomic,retain) NSArray * imageArray;
@property (nonatomic,retain) NSArray * titleArray;
@property (nonatomic,strong) UICollectionView * collectionView;

@end
