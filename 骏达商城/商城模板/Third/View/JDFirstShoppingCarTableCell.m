//
//  JDFirstShoppingCarTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDFirstShoppingCarTableCell.h"
#import "JDFristShoppiingCarTableModel.h"

@interface JDFirstShoppingCarTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) JDFristShoppiingCarTableModel *model;

@end

@implementation JDFirstShoppingCarTableCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self fitFont:_detailLabel.font];
    [self fitFont:_priceLabel.font];
    [self fitFont:_priceDetailLabel.font];
    [self fitFont:_deleteButton.titleLabel.font];
    [self fitFont:_addBtton.titleLabel.font];
    [self fitFont:_minusButton.titleLabel.font];
    [self fitFont:_numberText.font];
}

- (void)fitFont:(UIFont *)font
{
    CGFloat size = font.pointSize;
    font = [UIFont systemFontOfSize:size * ([UIScreen mainScreen].bounds.size.width)/414.0];
}

- (IBAction)minusButton:(UIButton *)sender
{
    NSString *str = _numberText.text;
    NSUInteger number = [str integerValue];
    if (number <= 1) {
        _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)number];
    }else{
        _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)--number];
    }
    //  加减操作后  需要跟新购物车
}

- (IBAction)addButton:(UIButton *)sender
{
    NSString *str = _numberText.text;
    NSUInteger number = [str integerValue];
    _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)++number];
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    [JDFristShoppiingCarTableModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    
    _model = [JDFristShoppiingCarTableModel mj_objectWithKeyValues:dataDict];
    _numberText.text = _model.qty;
    _priceLabel.text = _model.sub_total;
    _priceDetailLabel.text = [NSString stringWithFormat:@"￥ %@",_model.price];
    _detailLabel.text = _model.goods_name;
    
    [_photoImageView setImageWithURL:[NSURL URLWithString:_model.icon]];
}


@end
