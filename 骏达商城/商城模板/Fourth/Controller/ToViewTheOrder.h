//
//  ToViewTheOrder.h
//  商城模板
//
//  Created by kura on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllOrdersCell.h"

@interface ToViewTheOrder : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) UIView * classification;

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,retain) NSMutableArray * statusArray;
@property (nonatomic,retain) NSMutableArray * imageArray;
@property (nonatomic,retain) NSMutableArray * nameArray;
@property (nonatomic,retain) NSMutableArray * unitPriceArray;
@property (nonatomic,retain) NSMutableArray * numbersArray;
@property (nonatomic,retain) NSMutableArray * totalPriceArray;

@end
