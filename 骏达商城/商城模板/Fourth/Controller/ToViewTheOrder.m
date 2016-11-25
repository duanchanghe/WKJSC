//
//  ToViewTheOrder.m
//  商城模板
//
//  Created by kura on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ToViewTheOrder.h"

@interface ToViewTheOrder ()

{
    NSArray * titleArray;
    UILabel * redLabel;
    int X;
}

@end

NSString * identifier = @"AllOrdersCell";

@implementation ToViewTheOrder

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"我的订单";
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _classification = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 40/320)];
    _classification.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_classification];
    
    titleArray = [NSArray arrayWithObjects:@"全 部",@"已支付",@"未支付",@"已评价",@"待评价", nil];
    //循环创建五个按钮
    for (int i = 0; i < titleArray.count; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH * 64/320, 0, SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 40/320)];
        button.tag = i;
        [button addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self.view addSubview:button];
    }
    
    //创建4个竖线
    for (int i = 1; i < 5; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 1/320, SCREEN_WIDTH * 20/320)];
        label.backgroundColor = [UIColor blackColor];
        [self.view addSubview:label];
    }
    
    //下面红线
    redLabel = [[UILabel alloc]initWithFrame:CGRectMake(X * SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 39/320, SCREEN_WIDTH * 64/320, SCREEN_WIDTH * 1/320)];
    redLabel.backgroundColor = [UIColor colorWithRed:0.929 green:0.067 blue:0.110 alpha:1.00];
    [_classification addSubview:redLabel];
    
    //list
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_classification.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH, SCREN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"AllOrdersCell" bundle:nil] forCellReuseIdentifier:@"AllOrdersCell"];
    [self.view addSubview:_tableView];
}

- (void)showDetails:(UIButton*)sender {
    [UIView animateWithDuration:0.3 animations:^{
        redLabel.center = CGPointMake(sender.center.x, redLabel.center.y);
    }];
    
    if (sender.tag == 0) {
        X = 0;
    }else if (sender.tag == 1) {
        X = 1;
    }else if (sender.tag == 2) {
        X = 2;
    }else if (sender.tag == 3) {
        X = 3;
    }else {
        X = 4;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_WIDTH * 130/320;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AllOrdersCell * cell = (AllOrdersCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.status.text = @"未支付";
    cell.thumbnail.image = [UIImage imageNamed:@"headpot"];
    cell.name.text = @"东芝(Toshiba)中央空调变频多联机冷暖型10匹一拖九200平米以内设备套餐";
    cell.quantity.text = @"¥18000 * 3";
    cell.totalPrice.text = @"总价¥54000";
    
    return cell;
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
