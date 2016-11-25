//
//  IndexZeroCell.m
//  Ds_love
//
//  Created by By_smileds on 16/11/22.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import "IndexZeroCell.h"
#import "SDCycleScrollView.h"

@interface IndexZeroCell()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) SDCycleScrollView *cycleScroll;
@property (weak, nonatomic) UIView *lastMinuteView;
@property (weak, nonatomic) UILabel *titleLab;
@property (weak, nonatomic) UIImageView *rightIma;
@property (weak, nonatomic) UIButton *lastMinuteBtn;

@end
@implementation IndexZeroCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Create a image view
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    [self.cycleScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(375*RealScaleFactor, 187.5*RealScaleFactor));
    }];
    [self.lastMinuteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleScroll.mas_bottom);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [self.rightIma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lastMinuteView).offset(-10*RealScaleFactor);
        make.centerY.equalTo(self.lastMinuteView);
        make.size.mas_equalTo(CGSizeMake(15*RealScaleFactor, 15*RealScaleFactor));
    }];[self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 10*RealScaleFactor, 0, 0));
    }];
    [self.lastMinuteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (SDCycleScrollView*)cycleScroll {
    if (!_cycleScroll) {
        SDCycleScrollView *cyScroll = [[SDCycleScrollView alloc]init];
        cyScroll.localizationImageNamesGroup = @[@"2.0-75",@"2.0-75",@"2.0-75"];
        cyScroll.delegate = self;
        cyScroll.placeholderImage = [UIImage imageNamed:@"placeholder"];
        cyScroll.pageControlDotSize = CGSizeMake(6, 4);
       // cyScroll.pageControlBottomOffset = 6;
        cyScroll.pageDotColor = [UIColor whiteColor];
        cyScroll.currentPageDotColor = [UIColor colorWithRed:0.227 green:0.780 blue:0.784 alpha:1.00];// 自定义分页控件小圆标颜色
        //        cyScroll.currentPageDotImage = [UIImage imageNamed:@"dot_select"];
        //        cyScroll.pageDotImage = [UIImage imageNamed:@"dot"];
        
        [self addSubview:cyScroll];
        _cycleScroll = cyScroll;
    }
    return _cycleScroll;
}

- (UIView *)lastMinuteView {
    if (!_lastMinuteView) {
        UIView *lastMinuteView = [UIView new];
        lastMinuteView.backgroundColor = [UIColor colorWithRed:0.95 green:0.94 blue:0.96 alpha:1.00];
        [self addSubview:lastMinuteView];
        _lastMinuteView = lastMinuteView;
    }
    return _lastMinuteView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        UILabel *titleLab = [UILabel new];
        titleLab.text = @"限时抢购";
        titleLab.textColor = [UIColor colorWithRed:0.96 green:0.19 blue:0.00 alpha:1.00];
        titleLab.font = [UIFont systemFontOfSize:17*RealScaleFactor];
        [self.lastMinuteView addSubview:titleLab];
        _titleLab = titleLab;
    }
    return _titleLab;
}

- (UIImageView *)rightIma {
    if (!_rightIma) {
        UIImageView *rightIma = [UIImageView new];
        rightIma.image = [UIImage imageNamed:@"back1"];
        [self.lastMinuteView addSubview:rightIma];
        _rightIma = rightIma;
    }
    return _rightIma;
}

- (UIButton *)lastMinuteBtn {
    if (!_lastMinuteBtn) {
        UIButton *lastMinuteBtn = [UIButton new];
        lastMinuteBtn.backgroundColor = [UIColor clearColor];
        [lastMinuteBtn addTarget:self action:@selector(touchLastMinuteBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.lastMinuteView addSubview:lastMinuteBtn];
        _lastMinuteBtn = lastMinuteBtn;
    }
    return _lastMinuteBtn;
}

- (void)touchLastMinuteBtn:(id)sender {
    if (self.touchlastMinute) {
        self.touchlastMinute();
    }
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {

}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
}
@end
