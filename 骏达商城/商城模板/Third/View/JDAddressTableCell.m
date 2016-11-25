//
//  JDAddressTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDAddressTableCell.h"
#import "JDAddressTableModel.h"

@interface JDAddressTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) JDAddressTableModel *model;


@end



@implementation JDAddressTableCell


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
    [self fitFont:_nameLabel.font];
    [self fitFont:_PhoneLabel.font];
    [self fitFont:_addressLabel.font];
    
    _dataDict = dataDict;
    [JDAddressTableModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    _model = [JDAddressTableModel mj_objectWithKeyValues:dataDict];

    _nameLabel.text = [NSString stringWithFormat:@"收货人: %@", _model.name];
    _PhoneLabel.text = [NSString stringWithFormat:@"联系电话: %@", _model.phone];
    _addressLabel.text = [NSString stringWithFormat:@"地址: %@", _model.address];
    
}


@end
