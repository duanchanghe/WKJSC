//
//  Footprint.h
//  商城模板
//
//  Created by kura on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"
#import "MyFootprintCell.h"
#import "FootprintModel.h"

@interface Footprint : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,retain) NSMutableArray * imageArray;
@property (nonatomic,retain) NSMutableArray * nameArray;
@property (nonatomic,retain) NSMutableArray * priceArray;


@end
