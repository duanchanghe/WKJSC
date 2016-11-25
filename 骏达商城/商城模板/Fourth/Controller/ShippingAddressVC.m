//
//  ShippingAddressVC.m
//  商城模板
//
//  Created by kura on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ShippingAddressVC.h"

@interface ShippingAddressVC ()

{
    UIImage * unSelectedImage;
    UIImage * selectedImage;
}

@end

@implementation ShippingAddressVC

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationItem.title = @"收货地址";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameArray = [[NSMutableArray alloc]init];
    _contactArray = [[NSMutableArray alloc]init];
    _addressArray = [[NSMutableArray alloc]init];
    
    unSelectedImage = [UIImage imageNamed:@"收货地址-设为默认-灰"];
    selectedImage = [UIImage imageNamed:@"收货地址-设为默认-选定"];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view = _tableView;
    
    //footerView
    _footerView = [[UIView alloc]init];
    _tableView.tableFooterView = _footerView;
    
    //headerView
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 40/320)];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_WIDTH * 125/320;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"ShippingAddressCell";
    
    ShippingAddressCell * Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (Cell == nil) {
        Cell = [[ShippingAddressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    Cell.selectionStyle = NO;
    
    //分割
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 300/320,SCREEN_WIDTH * 10/320)];
    label.backgroundColor = [UIColor colorWithRed:0.957 green:0.957 blue:0.957 alpha:1.00];
    [Cell.contentView addSubview:label];
    
    Cell.leftImage.image = unSelectedImage;
    Cell.theConsignee.text = [NSString stringWithFormat:@"%@%@",@"收货人: ",@"何老师"];
    Cell.contacts.text = [NSString stringWithFormat:@"%@%@",@"联系方式: ",@"15629156212"];
    Cell.shippingAddress.text = [NSString stringWithFormat:@"%@%@",@"收货地址: ",@"湖北省武汉市武昌区东湖路181号文化创意产业园6号楼C区309"];
    
    if ((Cell.leftImage.image = unSelectedImage)) {
        Cell.leftImage.tag = 0;
    }else if ((Cell.leftImage.image = selectedImage)) {
        Cell.leftImage.tag = 1;
    }
    
    __weak typeof(ShippingAddressCell*)Cells = Cell;
    
    //设为默认
    Cell.setDefault = ^(){
        
        if (Cells.leftImage.tag == 0) {
            Cells.leftImage.image = selectedImage;
            Cells.leftImage.tag = 1;
        }else if (Cells.leftImage.tag == 1) {
            Cells.leftImage.image = unSelectedImage;
            Cells.leftImage.tag = 0;
        }
        
    };
    
    //编辑
    Cell.edited = ^(){
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:[[EditingAddress alloc]init] animated:YES];
    };
    
    //删除
    Cell.deleted = ^(){
        
    };
    
    return Cell;
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
