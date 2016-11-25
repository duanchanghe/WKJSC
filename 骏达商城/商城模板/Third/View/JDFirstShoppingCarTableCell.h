//
//  JDFirstShoppingCarTableCell.h
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDFirstShoppingCarTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@property (weak, nonatomic) IBOutlet UIButton *addBtton;

@property (nonatomic, copy) NSDictionary *dataDict;

@end
