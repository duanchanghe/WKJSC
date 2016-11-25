//
//  ShippingAddressCell.m
//  Legends of the campus
//
//  Created by kura on 16/8/9.
//  Copyright © 2016年 kura. All rights reserved.
//

#import "ShippingAddressCell.h"

@implementation ShippingAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        //收货人
        _theConsignee = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 15/320, self.contentView.frame.size.width, SCREEN_WIDTH * 20/320)];
        _theConsignee.backgroundColor = [UIColor clearColor];
        _theConsignee.textAlignment = NSTextAlignmentLeft;
        _theConsignee.textColor = [UIColor blackColor];
        _theConsignee.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_theConsignee];
        
        //联系方式
        _contacts = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 35/320, self.contentView.frame.size.width, SCREEN_WIDTH * 20/320)];
        _contacts.backgroundColor = [UIColor clearColor];
        _contacts.textAlignment = NSTextAlignmentLeft;
        _contacts.textColor = [UIColor blackColor];
        _contacts.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_contacts];
        
        //收货地址
        _shippingAddress = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 55/320, self.contentView.frame.size.width, SCREEN_WIDTH * 40/320)];
        _shippingAddress.backgroundColor = [UIColor clearColor];
        _shippingAddress.textAlignment = NSTextAlignmentLeft;
        _shippingAddress.textColor = [UIColor blackColor];
        _shippingAddress.font = [UIFont systemFontOfSize:14.0f];
        _shippingAddress.numberOfLines = 2;
        [self.contentView addSubview:_shippingAddress];
        
        //分割线
        UILabel * theLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 95/320, self.contentView.frame.size.width, SCREEN_WIDTH * 1/320)];
        theLabel.backgroundColor = [UIColor colorWithRed:0.769 green:0.765 blue:0.788 alpha:1.00];
        [self.contentView addSubview:theLabel];
        
        //设为默认
        _setToTheDefault = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 25/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 50/320, SCREEN_WIDTH * 20/320)];
        _setToTheDefault.backgroundColor = [UIColor clearColor];
        [_setToTheDefault setTitle:@"设为默认" forState:UIControlStateNormal];
        [_setToTheDefault setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _setToTheDefault.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_setToTheDefault addTarget:self action:@selector(defaultAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_setToTheDefault];
        
        //设为默认左边图片
        _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 12/320, SCREEN_WIDTH * 12/320)];
        _leftImage.center = CGPointMake(SCREEN_WIDTH * 18/320, _setToTheDefault.frame.origin.y + _setToTheDefault.frame.size.height/2);
        [self.contentView addSubview:_leftImage];
        
        //编辑
        _editOperation = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 185/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 50/320, SCREEN_WIDTH * 20/320)];
        _editOperation.backgroundColor = [UIColor clearColor];
        [_editOperation setImage:[UIImage imageNamed:@"收货地址-编辑"] forState:UIControlStateNormal];
        [_editOperation setTitle:@" 编辑" forState:UIControlStateNormal];
        [_editOperation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _editOperation.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_editOperation addTarget:self action:@selector(editingAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_editOperation];
        
        //删除
        _deleteOperation = [[UIButton alloc]initWithFrame:CGRectMake(_editOperation.frame.origin.x + _editOperation.frame.size.width, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 50/320, SCREEN_WIDTH * 20/320)];
        _deleteOperation.backgroundColor = [UIColor clearColor];
        [_deleteOperation setImage:[UIImage imageNamed:@"收货地址-删除"] forState:UIControlStateNormal];
        [_deleteOperation setTitle:@" 删除" forState:UIControlStateNormal];
        [_deleteOperation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _deleteOperation.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_deleteOperation addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_deleteOperation];

    }
    return self;
}

- (void)defaultAction {
    if (self.setDefault) {
        self.setDefault();
    }
}

- (void)editingAction {
    if (self.edited) {
        self.edited();
    }
}

- (void)deleteAction {
    if (self.deleted) {
        self.deleted();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
