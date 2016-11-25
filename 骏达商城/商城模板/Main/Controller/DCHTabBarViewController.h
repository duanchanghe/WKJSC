//
//  DCHTabBarViewController.h
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCHTabBar;

@interface DCHTabBarViewController : UITabBarController
@property (nonatomic, strong) DCHTabBar *myTabbar;
@property UIControl*view1;


- (void)revolveView:(UIView *)view;
@end
