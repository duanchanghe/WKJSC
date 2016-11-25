//
//  JDFristShoppiingCarTableModel.h
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/24.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDFristShoppiingCarTableModel : NSObject

@property (nonatomic, copy) NSString *options;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *goods_name;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *mer_id;

@property (nonatomic, copy) NSString *qty;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) BOOL need_update;

@property (nonatomic, copy) NSString *goods_id;

@property (nonatomic, copy) NSString *cur_price;

@property (nonatomic, copy) NSString *sub_total;

@end
