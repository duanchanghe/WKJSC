//
//  JDPayTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDPayTableCell.h"

@interface JDPayTableCell ()

@end

@implementation JDPayTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _payButton.selected = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)weiChartButton:(UIButton *)sender {
    
    if (sender.tag == _weChatButton.tag) {
        _weChatButton.selected = YES;
    }else{
        _weChatButton.selected = NO;
    }
    if (sender.tag == _payButton.tag) {
        _payButton.selected = YES;
    }else{
        _payButton.selected = NO;
    }
}
@end
