//
//  JDAddressController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDAddressController.h"
#import "JDAddressDetailTableCell.h"
static NSString *addressTableCell = @"JDAddressDetailTableCell";

@interface JDAddressController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JDAddressController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        [self addressListBlock:^(NSMutableDictionary *data) {
            NSArray *arr = data[@"data"][@"rows"];
            [_dataArray addObjectsFromArray:arr];
            [_tableView reloadData];
        }];
        
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem.title = @"返回";


    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDAddressDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:addressTableCell];
    cell.dataDict = self.dataArray[indexPath.row];
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
