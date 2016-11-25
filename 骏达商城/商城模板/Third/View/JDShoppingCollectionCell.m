//
//  JDShoppingCollectionCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/17.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDShoppingCollectionCell.h"
#import "JDSortedCollectionModel.h"

@interface JDShoppingCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

@property (nonatomic, strong) JDSortedCollectionModel *model;


@end

@implementation JDShoppingCollectionCell
- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)fitFont:(UIFont *)font
{
    CGFloat size = font.pointSize;
    font = [UIFont systemFontOfSize:size * ([UIScreen mainScreen].bounds.size.width)/414.0];
    
}


- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    [JDSortedCollectionModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    _model = [JDSortedCollectionModel mj_objectWithKeyValues:dataDict];
    
    [self fitFont:_nameLabel.font];
    [self fitFont:_priceLabel.font];
    [self fitFont:_firstLabel.font];
    [self fitFont:_secondLabel.font];
    [self fitFont:_thirdLabel.font];
    
    _nameLabel.text = _model.name;
    [_imageView setImageWithURL:[NSURL URLWithString:_model.icon]];
    NSString *temStr = _model.price_market;
    NSString *str = [NSString stringWithFormat:@"¥ %.0ld",(long)[temStr integerValue]];
    NSDictionary *attrbuted = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:str attributes: attrbuted];
    [attString setAttributes:@{[UIFont systemFontOfSize:15]:NSFontAttributeName} range:NSMakeRange(0, 1)];
    _priceLabel.attributedText = attString;
    [_priceLabel sizeToFit];
    
}


@end
