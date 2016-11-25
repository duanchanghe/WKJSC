//
//  JDNavigationController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDNavigationController.h"

@interface JDNavigationController ()

@end

@implementation JDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏颜色
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.976
                                                      green:0.369
                                                       blue:0.200
                                                      alpha:1.00];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:19],
                                               NSForegroundColorAttributeName:[UIColor whiteColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
