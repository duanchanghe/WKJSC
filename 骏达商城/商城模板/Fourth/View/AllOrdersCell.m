//
//  AllOrdersCell.m
//  商城模板
//
//  Created by kura on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "AllOrdersCell.h"

@implementation AllOrdersCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //订单状态
    _status.frame = CGRectMake(SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 20/320);
    _status.backgroundColor = [UIColor clearColor];
    _status.textColor = [UIColor colorWithRed:0.612 green:0.020 blue:0.055 alpha:1.00];
    _status.textAlignment = NSTextAlignmentLeft;
    
    //缩略图
    _thumbnail.frame = CGRectMake(_status.frame.origin.x, CGRectGetMaxY(_status.frame) + SCREEN_WIDTH * 5/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 100/320);
    _thumbnail.backgroundColor = [UIColor clearColor];
    
    //名字
    _name.frame = CGRectMake(CGRectGetMaxX(_thumbnail.frame) + SCREEN_WIDTH * 10/320, _thumbnail.frame.origin.y, SCREEN_WIDTH * 130/320, SCREEN_WIDTH * 100/320);
    _name.backgroundColor = [UIColor clearColor];
    _name.textColor = [UIColor blackColor];
    _name.textAlignment = NSTextAlignmentLeft;
    _name.numberOfLines = 0;
    
    //数量
    _quantity.frame = CGRectMake(CGRectGetMaxX(_name.frame) + SCREEN_WIDTH * 5/320, _name.frame.origin.y + SCREEN_WIDTH * 20/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 20/320);
    _quantity.backgroundColor = [UIColor clearColor];
    _quantity.textColor = [UIColor colorWithRed:0.612 green:0.020 blue:0.055 alpha:1.00];
    _quantity.textAlignment = NSTextAlignmentLeft;
    _quantity.font = [UIFont systemFontOfSize:13.0f];
    
    //总价
    _totalPrice.frame = CGRectMake(_quantity.frame.origin.x, CGRectGetMaxY(_quantity.frame) + SCREEN_WIDTH * 20/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 20/320);
    _totalPrice.backgroundColor = [UIColor clearColor];
    _totalPrice.textColor = [UIColor colorWithRed:0.612 green:0.020 blue:0.055 alpha:1.00];
    _totalPrice.textAlignment = NSTextAlignmentLeft;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
