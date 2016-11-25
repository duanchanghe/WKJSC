//
//  JDAddressDetailTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDAddressDetailTableCell.h"
#import "JDAddressDetailTableModel.h"

@interface JDAddressDetailTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *defualtButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (nonatomic, strong) JDAddressDetailTableModel *model;

@end

@implementation JDAddressDetailTableCell


- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    [JDAddressDetailTableModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    _model = [JDAddressDetailTableModel mj_objectWithKeyValues:dataDict];
    _nameLabel.text = _model.name;
    _phoneLable.text = _model.phone;
    _detailLabel.text = _model.address;
    if ([_model.is_default boolValue]) {
        _defualtButton.selected = YES;
    }else{
        _defualtButton.selected = NO;
    }
}


@end
