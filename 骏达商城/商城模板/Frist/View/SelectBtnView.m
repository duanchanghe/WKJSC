//
//  SelectBtnView.m
//  Ds_love
//
//  Created by By_smileds on 16/11/23.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import "SelectBtnView.h"
@interface SelectBtnView()
@property (weak, nonatomic) UIButton *mainbtn;
@property (weak, nonatomic) UIView *btnRightView;
@property (weak, nonatomic) UIImageView *selectBtnImageView;
@end
//标记旋转角度
CGFloat angles;
@implementation SelectBtnView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        angles = 0.0;
        [self creatBtnUI];
        self.backgroundColor = [UIColor whiteColor];
        //        [self createwave];
    }
    return self;
}
- (void)creatBtnUI {
    [self.mainbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.btnRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(RealScaleFactor*10);
        make.bottom.equalTo (self).offset(RealScaleFactor*-10);
        make.width.mas_equalTo(0.5);
    }];
    [self.selectBtnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btnRightView).offset(-5*RealScaleFactor);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(15*RealScaleFactor, 15*RealScaleFactor));
    }];
    
}
- (UIButton *)mainbtn {
    if (!_mainbtn) {
        UIButton *mainbtn = [[UIButton alloc]init];
        [mainbtn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
        mainbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [mainbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:mainbtn];
        _mainbtn = mainbtn;
    }
    return _mainbtn;
}
- (UIView *)btnRightView {
    if (!_btnRightView) {
        UIView *btnRightView = [[UIView alloc]init];
        btnRightView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:btnRightView];
        _btnRightView = btnRightView;
    }
    return _btnRightView;
}
- (UIImageView *)selectBtnImageView {
    if (!_selectBtnImageView) {
        UIImageView *selectBtnImageView = [[UIImageView alloc]init];
        selectBtnImageView.image = [UIImage imageNamed:@"upward"];
        [self addSubview:selectBtnImageView];
        selectBtnImageView.hidden = YES;
        _selectBtnImageView = selectBtnImageView;
    }
    return _selectBtnImageView;
}
- (void)setBtnTitle:(NSString *)btnTitle {
    [self.mainbtn setTitle:btnTitle forState:UIControlStateNormal];
}
- (void)touchAction:(id)sender {
    if (self.btnAction) {
        self.btnAction(self);
    }
}

- (void)setRightImaIsHidden:(BOOL)rightImaIsHidden {
    self.selectBtnImageView.hidden = rightImaIsHidden;
}

- (void)setRightViewIsHidden:(BOOL)rightViewIsHidden {
    self.btnRightView.hidden = rightViewIsHidden;
}

- (void)setAngle:(CGFloat)angle {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1;
    animation.repeatCount = 1;
    animation.fromValue = [NSNumber numberWithFloat:angles];
    animation.toValue = [NSNumber numberWithFloat: angle];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.selectBtnImageView.layer addAnimation:animation forKey:@"rotate-layer"];
    angles = angle;
}

@end
