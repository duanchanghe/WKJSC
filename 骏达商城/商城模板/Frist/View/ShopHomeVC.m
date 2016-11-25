//
//  ShopHomeVC.m
//  Ds_love
//
//  Created by By_smileds on 16/11/22.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import "ShopHomeVC.h"
#import "ShopHomeItem.h"
#import "XLPlainFlowLayout.h"
#import "headerView.h"
#import "IndexZeroCell.h"
#import "IndexOneCell.h"
#import "SelectBtnView.h"
static NSString *const CellIdentifier = @"CellIdentifier";

@interface ShopHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UITextField *titleTextfield;
@property (nonatomic, strong) UIButton *rightBarBtn;
@property (nonatomic, strong) UIButton *leftBarBtn;
@property (weak, nonatomic) UICollectionView *mainCollection;
@property (weak, nonatomic) UIView *tableHeaderView;
@property (strong, nonatomic) headerView *header;

@end

@implementation ShopHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.96 green:0.37 blue:0.24 alpha:1.00];
    [self titleTextfield];
    [self rightBarBtn];
    [self leftBarBtn];
    [self tableHeaderView];
    [self mainCollection];
}
- (void)creatUI {
}
- (UIButton *)rightBarBtn {
    if (!_rightBarBtn) {
        UIButton *rightBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBarBtn.frame = CGRectMake(0, 0, 20, 20);
        [rightBarBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [rightBarBtn addTarget:self action:@selector(touchRightBarBtn:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarBtn];
        self.navigationItem.rightBarButtonItem = rightBarButtonItem;
        _rightBarBtn = rightBarBtn;
    }
    return _rightBarBtn;
}
- (UIButton *)leftBarBtn {
    if (!_leftBarBtn) {
        UIButton *leftBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarBtn.frame = CGRectMake(0, 0, 20, 20);
        [leftBarBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [leftBarBtn addTarget:self action:@selector(touchLeftBarBtn:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBarBtn];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        _leftBarBtn = leftBarBtn;
    }
    return _leftBarBtn;
}
- (void)touchRightBarBtn:(UIButton *)btn {
    
    
}
- (void)touchLeftBarBtn:(UIButton *)btn {
    
    
}

- (UITextField *)titleTextfield {
    if (!_titleTextfield) {
        UITextField *titleTextfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 0,RealScaleFactor*260, RealScaleFactor*30)];
        titleTextfield.backgroundColor = [UIColor colorWithRed:0.82 green:0.19 blue:0.13 alpha:1.00];
        titleTextfield.borderStyle = UITextBorderStyleNone;
        titleTextfield.layer.cornerRadius = 10;
        titleTextfield.layer.masksToBounds = YES;
        titleTextfield.placeholder = @"搜索你喜欢的";
        titleTextfield.textAlignment = NSTextAlignmentCenter;
        titleTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        titleTextfield.font = [UIFont systemFontOfSize:14];
        [titleTextfield setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        self.navigationItem.titleView = titleTextfield;
        _titleTextfield = titleTextfield;
    }
    return _titleTextfield;
}
- (UICollectionView *)mainCollection
{
    if (!_mainCollection) {
        
        //布局
        XLPlainFlowLayout *layout = [[XLPlainFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        //设置头部视图的尺寸
        layout.headerReferenceSize = CGSizeMake(RealScaleFactor*375, RealScaleFactor*50);
        UICollectionView *mainCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREN_HEIGHT) collectionViewLayout:layout];
        mainCollection.showsVerticalScrollIndicator = NO;
        //    self.automaticallyAdjustsScrollViewInsets = NO;
        mainCollection.bounces = NO;
        mainCollection.delegate = self;
        mainCollection.dataSource = self;
        mainCollection.backgroundColor = [UIColor colorWithRed:0.95 green:0.94 blue:0.96 alpha:1.00];
        [mainCollection registerNib:[UINib nibWithNibName:NSStringFromClass([ShopHomeItem class]) bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
        [mainCollection registerNib:[UINib nibWithNibName:NSStringFromClass([IndexOneCell class]) bundle:nil] forCellWithReuseIdentifier:@"IndexOneCell"];
        [mainCollection registerClass:[headerView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        [mainCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewNil"];
        [mainCollection registerClass:[IndexZeroCell class] forCellWithReuseIdentifier:@"IndexZeroCell"];
        [self.view addSubview:mainCollection];
        _mainCollection = mainCollection;
    }
    return _mainCollection;
}
// 设置headerView和footerView的
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
        if (kind == UICollectionElementKindSectionHeader) {
            __weak typeof(self)ws = self;
            if (indexPath.section == 2) {
                self.header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
                self.header.sellectType = ^(SelectBtnView *btnView,int times) {
                    [ws requestdata:btnView time:times];
                };
                reusableView = _header;
            }else {
                UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewNil" forIndexPath:indexPath];
                reusableView = header;
            }
           
        }
        return reusableView;
    
}
//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }else{
        return 20;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        IndexZeroCell *cell = (IndexZeroCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"IndexZeroCell" forIndexPath:indexPath];
        cell.touchlastMinute = ^(){
            [self lastMinuteAction];
        };
        return cell;
    }else if(indexPath.section == 2){
        ShopHomeItem *cell = (ShopHomeItem *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        return cell;
    }else{
        IndexOneCell *cell = (IndexOneCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"IndexOneCell" forIndexPath:indexPath];
        return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(RealScaleFactor*375, RealScaleFactor*227.5);
    }else if (indexPath.section == 1) {
        return CGSizeMake(RealScaleFactor*187, RealScaleFactor*80);
    }else{
        return CGSizeMake(RealScaleFactor*187, RealScaleFactor*187);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(0, 0);
    }else if (section == 1) {
        return CGSizeMake(0, 0);
    }else{
        return CGSizeMake(RealScaleFactor*375, RealScaleFactor*40);
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 1||section == 2) {
         return UIEdgeInsetsMake(2, 0, 0, 0);
    }else{
      return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
- (void)requestdata:(SelectBtnView *)btnView time:(int)times{
    NSLog(@"%@",times%2 ==0?@"向下":@"向上");
    [UIView performWithoutAnimation:^{
        [self.mainCollection reloadSections:[NSIndexSet indexSetWithIndex:2]];
    }];
    self.header.btnView = btnView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)lastMinuteAction {
    NSLog(@"点击了限时抢购");
}
@end
