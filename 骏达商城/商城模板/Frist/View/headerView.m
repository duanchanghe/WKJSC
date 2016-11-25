//
//  headerView.m
//  Ds_love
//
//  Created by By_smileds on 16/11/23.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import "headerView.h"
#import "SelectBtnView.h"
@interface headerView()
@property (weak, nonatomic)UIView *colorView;
@end
//价格点击次数
int s;
//是否为从其他类第一次点击到价格类
BOOL isTouchPrice;
//是否为从价格类第一次点击到其他类
BOOL isTouchOther;

@implementation headerView
- (id)initWithFrame:(CGRect)frame {
    
    self=[super initWithFrame:frame];
    
    if (self) {
        s = 0;
        isTouchPrice = NO;
        isTouchOther = YES;
        self.backgroundColor = [UIColor colorWithRed:0.95 green:0.94 blue:0.96 alpha:1.00];
        [self createHeaderView];
    }
    return self;
    
}
- (void)createHeaderView {
    [self createFiveBtn];
    self.colorView.frame = CGRectMake(0, self.height-2, SCREEN_WIDTH/5, 2);
    
}
- (void)createFiveBtn {
    NSArray *titleArr = @[@"全部",@"推荐",@"促销",@"方案",@"价格"];
    for (int m = 0; m<5; m++) {
        SelectBtnView *selectBtn = [[SelectBtnView alloc]init];
        selectBtn.btnTitle = titleArr[m];
        if (m == 4) {
            selectBtn.rightImaIsHidden = NO;
            selectBtn.rightViewIsHidden = YES;
        }
        selectBtn.tag = m;
        selectBtn.btnAction = ^(SelectBtnView *btnView){
            [self touchAction:btnView];
        };
        [self addSubview:selectBtn];
        [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH/5 *m);
            make.top.equalTo(self);
            make.bottom.equalTo(self).offset(RealScaleFactor*-2);
            make.width.mas_equalTo(SCREEN_WIDTH/5);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/5, self.height-2*RealScaleFactor));
        }];
    };
}
- (UIView *)colorView {
    if (!_colorView) {
        UIView *colorView = [UIView new];
        colorView.backgroundColor = [UIColor orangeColor];
        [self addSubview:colorView];
        _colorView = colorView;
    }
    return _colorView;
}
- (void)touchAction:(SelectBtnView *)btnView {
    [UIView animateWithDuration:0.3 animations:^{
        self.colorView.frame = CGRectMake(SCREEN_WIDTH/5*btnView.tag, self.height-2*RealScaleFactor, SCREEN_WIDTH/5, 2*RealScaleFactor);
    }];
    if (btnView.tag == 4) {
        int times;
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"times"]) {
              times = [[[NSUserDefaults standardUserDefaults] objectForKey:@"times"] intValue];
        }else{
            times = 0;
        }
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstTouchOther"] == YES) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isFirstTouchOther"];
        }else{
            times++;
        }
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",times] forKey:@"times"];
    }else{
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"times"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstTouchOther"];
        }
    }
       if (self.sellectType) {
        self.sellectType(btnView,[[[NSUserDefaults standardUserDefaults] objectForKey:@"times"] intValue]);
    }
}
- (void)setBtnView:(SelectBtnView *)btnView {
    [UIView animateWithDuration:0.3 animations:^{
        self.colorView.frame = CGRectMake(SCREEN_WIDTH/5*btnView.tag, self.height-2*RealScaleFactor, SCREEN_WIDTH/5, 2*RealScaleFactor);
    }];
    SelectBtnView *changeBtnView = [self viewWithTag:4];
    if (btnView.tag == 4) {
        if (isTouchPrice == YES) {
            isTouchPrice = NO;
            s--;
        }
        s++;
        isTouchOther = NO;
    }else{
        if (isTouchOther == YES) {
            s = 1;
            isTouchOther = NO;
        }
        //点击其他类价格类点击次数变为1，1会还原
        isTouchPrice = YES;
    }
    changeBtnView.angle = s%2 == 0?M_PI:0;
}

- (void)setViewIndex:(NSInteger)viewIndex{
}
@end
