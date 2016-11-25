//
//  MyButton.m
//  myButton
//
//  Created by 段昌鹤 on 2016/11/20.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.phoneView.layer.masksToBounds = YES;
    self.phoneView.layer.cornerRadius = self.phoneView.frame.size.width/2.0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
