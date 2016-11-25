//
//  AllOrdersCell.h
//  商城模板
//
//  Created by kura on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllOrdersCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *status;

@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *quantity;

@property (weak, nonatomic) IBOutlet UILabel *totalPrice;

@end
