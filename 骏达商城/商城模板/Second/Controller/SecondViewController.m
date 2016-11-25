//
//  SecondViewController.m
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "SecondViewController.h"
#import "JDSortedCollectionCell.h"
#import "JDGoodsDetailController.h"

static NSString *collectionCell = @"JDSortedCollectionCell";
static NSString *detailController = @"JDGoodsDetailController";

@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate,UIScrollViewDelegate>
// 商品列表的基本属性的配置
@property (nonatomic, copy) NSString *page_size;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *catalog;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *keyword;

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchButton;
@property (nonatomic, copy) NSMutableArray *dataArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置上拉分段加载
    [self sectionalLoadedDate];
    
    // 设置数据请求初始值
    [self setInitialValue];
    [self clickAllButton:_allButton];
    [self clickButton:_allButton];
}

// 设置每组集合视图的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

// 给集合视图的 Cell 传值
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JDSortedCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell
                                                                             forIndexPath:indexPath];
    cell.dataDict = self.dataArray[indexPath.row];
    return cell;
}

// 设置 cell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(SCREEN_WIDTH/2.0 - 4, SCREEN_WIDTH/2.0 + 40);
    return size;
}
// cell 选中跳转 并传值
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JDGoodsDetailController *vc = StoryboardIdentifier(@"JDGoodsDetailController");
    NSDictionary *dic = self.dataArray[indexPath.row];
    vc.goods_id = dic[@"id"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

// 集合视图分段加载
- (void)sectionalLoadedDate
{
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.collectionView.mj_footer beginRefreshing];
        _page_size = [NSString stringWithFormat:@"%ld",([_page_size integerValue] + 6)];
        [self loadData];
    }];
}


// 数据请求设置初始值
- (void)setInitialValue
{
    _page_size  = @"6";
    _page = @"1";
    _catalog = @"";
    _currency = @"cny";
    _order = @"ASC";
}

// 给请求到的数据赋值
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


// 点击切换 button 背景颜色
- (IBAction)clickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    for (UIButton *button in sender.superview.subviews) {
        if (![button isEqual:sender]) {
            button.selected = NO;
            button.backgroundColor = [UIColor whiteColor];
        }else{
            button.backgroundColor = [UIColor orangeColor];
        }
    }
}

// 点击正常排序
- (IBAction)clickAllButton:(UIButton *)sender
{
    _sort = @"sort";
    _keyword = @" ";
    _searchText.text = @"";
    [self loadData];
}

// 点击促销排序
- (IBAction)clickPromotionButton:(UIButton *)sender
{
    _sort = @"end_at";
    _keyword = @" ";
    _searchText.text = @"";
    [self loadData];
}

// 点击热卖排序
- (IBAction)clickRecommendButton:(UIButton *)sender
{
    _sort = @"recommend";
    _keyword = @" ";
    _searchText.text = @"";
    [self loadData];
}

// 加载数据
- (void)loadData
{
    [self listPage:_page
          Pagesize:_page_size
           KeyWord:_keyword
           Catalog:_catalog
          Currency:_currency
              Sort:_sort
             Order:_order
             Block:^(NSMutableDictionary *data) {
                 NSArray *rows = data[@"data"][@"rows"];
                 [self.dataArray removeAllObjects];
                 [self.dataArray addObjectsFromArray:rows];
                 [_collectionView reloadData];
                 
                 // 分段加载判断是否加载完
                 if ([_page_size integerValue] >= self.dataArray.count + 6)
                 {
                     [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                 }
                 else
                 {
                     [self.collectionView.mj_footer endRefreshing];
                 }
             }];
}

// 点击搜索
- (IBAction)clickSearchButton:(UIBarButtonItem *)sender
{
    [_searchText resignFirstResponder];
    _keyword = _searchText.text;
    [self loadData];
    _keyword = @" ";
}

// 滚动收起键盘
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_searchText resignFirstResponder];
}

// 软键盘return搜索
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_searchText resignFirstResponder];
    _keyword = _searchText.text;
    [self loadData];
    _keyword = @" ";
    return YES;
}

@end
