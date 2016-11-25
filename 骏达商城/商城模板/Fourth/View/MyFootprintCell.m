//
//  MyFootprintCell.m
//  商城模板
//
//  Created by kura on 2016/11/21.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "MyFootprintCell.h"

@implementation MyFootprintCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageUrl = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 60/320, SCREEN_WIDTH * 60/320)];
        [self.contentView addSubview:_imageUrl];
        
        _name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageUrl.frame) + SCREEN_WIDTH * 10/320, _imageUrl.frame.origin.y, SCREEN_WIDTH * 230/320, SCREEN_WIDTH * 40/320)];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.numberOfLines = 2;
        _name.font = [UIFont systemFontOfSize:14.0f];
        _name.textColor = [UIColor grayColor];
        [self.contentView addSubview:_name];
        
        _price = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageUrl.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 50/320, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 20/320)];
        _price.textAlignment = NSTextAlignmentLeft;
        _price.numberOfLines = 1;
        _price.font = [UIFont systemFontOfSize:13.0f];
        _price.textColor = [UIColor colorWithRed:0.976 green:0.369 blue:0.200 alpha:1.00];
        [self.contentView addSubview:_price];
        
    }
    return self;
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
