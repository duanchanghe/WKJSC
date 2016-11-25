//
//  DCHTabBar.h
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCHTabBar;

@protocol DCHtabBarDelegate <UITabBarDelegate>

@required
-(void)addButtonClick:(DCHTabBar *)tabBar;

@end

@interface DCHTabBar : UITabBar

@property (nonatomic,weak) id <DCHtabBarDelegate> tabBarDelegate;

//指向中间“+”按钮
@property (nonatomic,weak) UIButton *addButton;

@end
