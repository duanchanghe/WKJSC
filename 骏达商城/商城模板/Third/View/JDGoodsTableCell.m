//
//  JDGoodsTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDGoodsTableCell.h"
#import "JDGoodsTableModel.h"

@interface JDGoodsTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (nonatomic, strong) JDGoodsTableModel *model;

@end


@implementation JDGoodsTableCell


- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    [JDGoodsTableModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    _model = [JDGoodsTableModel mj_objectWithKeyValues:dataDict];
    
    
//    _detailLabel.text = _goods_name;
//    _priceLabel.text = [NSString stringWithFormat:@"￥ %@",_price];
//    _countLabel.text = [NSString stringWithFormat:@"X %@",_qty];
//    _totalLabel.text = [NSString stringWithFormat:@"合计：￥ %ld",[_qty integerValue] * [_price integerValue]];
//    _totalCountLabel.text = [NSString stringWithFormat:@"共计%@件商品",_qty];
//    [_photoView setImageWithURL:[NSURL URLWithString:_icon]];
}


@end
