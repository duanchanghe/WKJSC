//
//  FourthCell.m
//  商城模板
//
//  Created by kura on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "FourthCell.h"

@implementation FourthCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 50/320, SCREEN_WIDTH * 50/320)];
        _image.center = CGPointMake(self.contentView.frame.size.width/2, SCREEN_WIDTH * 40/320);
        [self.contentView addSubview:_image];
        
        _title = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_image.frame) + SCREEN_WIDTH * 5/320, self.contentView.frame.size.width, SCREEN_WIDTH * 20/320)];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:14.0f];
        _title.textColor = [UIColor blackColor];
        [self.contentView addSubview:_title];
        
    }
    return self;
}

@end
