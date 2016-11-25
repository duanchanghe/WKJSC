//
//  ThirdViewController.m
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ThirdViewController.h"
#import "JDFirstShoppingCarTableCell.h"
#import "JDSecondShoppingCarTableCell.h"
#import "JDShoppingCollectionCell.h"
#import "JDCreateOrdeController.h"

static NSString *collectionCell = @"JDShoppingCollectionCell";
static NSString *firstTableViewCell = @"JDFirstShoppingCarTableCell";
static NSString *secondTableViewCell = @"JDSecondShoppingCarTableCell";

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *allDetailLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

@property (nonatomic, copy) NSMutableArray *collectionArray;

@end

@implementation ThirdViewController

// 数据源数组初始化
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)collectionArray
{
    if (!_collectionArray) {
        _collectionArray = [NSMutableArray array];
    }
    return _collectionArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    _goButton.layer.masksToBounds = YES;
    _goButton.layer.cornerRadius = 5;
    
    // 初始化 初始值
    [self setInitialValue];
}


// 初始化 初始值
- (void)setInitialValue
{
    _mer_id = @"1";
    _opt = @"UserCart/List";
    _token = [self getToken];
    if (_token == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示！"
                                                                       message:@"您还没有登入哦！快去登入吧"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleDestructive
                                                       handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:action];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    }else{

        [self requestData];
    }
}

#pragma mark -----tableView代理方法实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;   
}

// 每组有多少行
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dataArray.count;
    } else {
        return 1;
    }
}

// tableViewCell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        JDFirstShoppingCarTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:firstTableViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.0];
        cell.dataDict = self.dataArray[indexPath.row];
        
        //    给 cell 内部的按钮添加点击事件
        [cell.deleteButton addTarget:self
                              action:@selector(updataProduct:)
                    forControlEvents:UIControlEventTouchUpInside];
        [cell.addBtton addTarget:self
                          action:@selector(addProduct:)
                forControlEvents:UIControlEventTouchUpInside];
        [cell.minusButton addTarget:self
                             action:@selector(minusProduct:)
                   forControlEvents:UIControlEventTouchUpInside];
        return cell;

     
    } else {
//        预留的猜你喜欢的 cell
        JDSecondShoppingCarTableCell *cell = [tableView dequeueReusableCellWithIdentifier:secondTableViewCell];
        [self listPage:@"1"
              Pagesize:@"4"
               KeyWord:@""
               Catalog:@""
              Currency:@"cny"
                  Sort:@"sort"
                 Order:@"ASC"
                 Block:^(NSMutableDictionary *data) {
                     NSArray *rows = data[@"data"][@"rows"];
                     [self.collectionArray removeAllObjects];
                     [self.collectionArray addObjectsFromArray:rows];
                     [cell.collectionView reloadData];
                  }];
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDGoodsDetailController *vc = StoryboardIdentifier(@"JDGoodsDetailController");
    NSDictionary *dic = nil;
    if (indexPath.section == 0) {
        dic = self.dataArray[indexPath.row];
        vc.goods_id = dic[@"goods_id"];
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}

// 设置 tableViewCell 高度
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120;
    } else {
        return SCREEN_WIDTH + 84;
    }
}

// tableViewCell 内部减号按钮点击事件
- (void)minusProduct:(UIButton *)sender
{
    NSDictionary *dict = [self getDictionary:sender];
    NSString *ID = dict[@"id"];
    NSInteger qt = [dict[@"qty"] integerValue];
    if (qt <= 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最少了！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定"
                                                             style:UIAlertActionStyleDefault
                                                           handler:nil];
        UIAlertAction *canelAction = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:nil];
        [alert addAction:sureAction];
        [alert addAction:canelAction];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    }else{
        NSString *qty = [NSString stringWithFormat:@"%ld",(long)(qt-1)];
        [self updataRequest:ID Qty:qty];
    }
}

// tableViewCell 内部加号按钮点击事件
- (void)addProduct:(UIButton *)sender
{
    NSDictionary *dict = [self getDictionary:sender];
    NSString *ID = dict[@"id"];
    NSInteger qt = [dict[@"qty"] integerValue];
    NSString *qty = [NSString stringWithFormat:@"%ld",(long)(qt+1)];
    [self updataRequest:ID Qty:qty];
    // 更新购物车
}

// tableViewCell 内部删除商品
- (void)updataProduct:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:@"是否要删除 ？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        
        NSDictionary *dict = [self updataGetDictionary:sender];
        NSString *ID = dict[@"id"];
        [self updataRequest:ID Qty:@"0"];
    }];
    UIAlertAction *canelAction = [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
    [alert addAction:sureAction];
    [alert addAction:canelAction];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}


// 增减商品事件 获取 cell 的值
- (NSDictionary *)getDictionary:(UIButton *)button
{
    JDFirstShoppingCarTableCell *cell = (JDFirstShoppingCarTableCell *)button.superview.superview.superview.superview;
    return cell.dataDict;
}

// 更新购物车 获取 cell 的值
- (NSDictionary *)updataGetDictionary:(UIButton *)button
{
    JDFirstShoppingCarTableCell *cell = (JDFirstShoppingCarTableCell *)button.superview.superview.superview;
    return cell.dataDict;
}

// 
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return @"你购买的商品";
    } else {
        return @"猜你喜欢的";
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    } else {
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

#pragma mark -----collectionView代理方法实现
// 第二个 cell 内部的 collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.collectionArray.count;
}

// 第二个 cell 内部的 collectionView 赋值
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JDShoppingCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell
                                                                             forIndexPath:indexPath];
    cell.dataDict = self.collectionArray[indexPath.row];
    return cell;
}

// 设置 collectionViewcell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(SCREEN_WIDTH/2.0 - 4, SCREEN_WIDTH/2.0 + 40);
    return size;
}

// collectionCell 选中跳转 传值
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    JDGoodsDetailController *vc = StoryboardIdentifier(@"JDGoodsDetailController");
    NSDictionary *dic = self.collectionArray[indexPath.row];
    vc.goods_id = dic[@"id"];
    [self.navigationController pushViewController:vc animated:YES];
}


// 获取购物车清单
- (void)requestData
{
    [self cartListBlock:^(NSMutableDictionary *dataDic) {
        NSDictionary *data = dataDic[@"data"];
        NSArray *rows = data[@"rows"];
// 没有商品隐藏底部 view
        if (!rows.count) {
//            self.bottomView.hidden = YES;
        }else{
//            self.bottomView.hidden = NO;
        }
        
        NSString *total_item =  [NSString stringWithFormat:@"%@", data[@"total_item"]];
        NSString *total_amount = [NSString stringWithFormat:@"￥%@", data[@"total_amount" ]];
        NSString *total = [NSString stringWithFormat:@"共计%@件商品 合计：%@",total_item,total_amount];
        
        // 给底部视图的 label 写入属性字符串
        NSRange range = [total rangeOfString:total_amount];
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor lightGrayColor],NSForegroundColorAttributeName,nil];
        NSMutableAttributedString *totalAttributes = [[NSMutableAttributedString alloc] initWithString:total attributes:attributes];
        NSDictionary *attributes1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName,nil];
        [totalAttributes addAttributes:attributes1 range:NSMakeRange(2, total_item.length)];
        [totalAttributes addAttributes:attributes1 range:range];
        self.allDetailLabel.attributedText = totalAttributes;
        
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:rows];
        [self.tableView reloadData];
    }];
}

// 更新商品数量
- (void)updataRequest:(NSString *)goods_id Qty:(NSString *)qty
{
    [self cartUpdateGoodsID:goods_id
                   GoodsQty:qty
                      Block:^(NSMutableDictionary *dataDic) {
                          [self requestData];
                      }];
}






@end
