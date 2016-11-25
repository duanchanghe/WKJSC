//
//  FourthViewController.m
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageArray = [NSArray arrayWithObjects:@"足迹",@"我的收藏",@"发现",@"我的积分",@"工程进度",@"我的余额", nil];
    _titleArray = [NSArray arrayWithObjects:@"足迹",@"我的收藏",@"发现",@"积分商城",@"工程进度",@"我的余额", nil];
    
    [self setTopView:_topView];
    [self setDisplayView:_displayView];
    [self setOrders:_orders];
    [self setCollectionView:_collectionView];
}

- (void)setTopView:(UIImageView *)topView {
    topView = [[UIImageView alloc]init];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/2);
    topView.image = [UIImage imageNamed:@"我的-背景图"];
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    _settings = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 280/320, SCREEN_WIDTH * 40/320, SCREEN_WIDTH * 40/320, SCREEN_WIDTH * 40/320)];
    [_settings setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    [_settings addTarget:self action:@selector(goSettings) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_settings];
    
    _headPortrait = [[UIButton alloc]init];
    _headPortrait.frame = CGRectMake(SCREEN_WIDTH * 15/320, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 70/320, SCREEN_WIDTH * 70/320);
    _headPortrait.backgroundColor = [UIColor whiteColor];
    _headPortrait.layer.masksToBounds = YES;
    _headPortrait.layer.cornerRadius = _headPortrait.frame.size.width/2;
    [_headPortrait setImage:[UIImage imageNamed:@"headpot"] forState:UIControlStateNormal];
    [_headPortrait addTarget:self action:@selector(goLoginVC) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_headPortrait];
    
    _nickName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headPortrait.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH *75/320, SCREEN_WIDTH * 150/320, SCREEN_WIDTH * 30/320)];
    _nickName.backgroundColor = [UIColor clearColor];
    _nickName.textColor = [UIColor whiteColor];
    _nickName.textAlignment = NSTextAlignmentLeft;
    _nickName.text = [NSString stringWithFormat:@"%@%@",@"昵称:",@"程超"];
    [topView addSubview:_nickName];
    
    _myBalance = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headPortrait.frame) + SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 115/320, SCREEN_WIDTH * 150/320, SCREEN_WIDTH * 30/320)];
    _myBalance.backgroundColor = [UIColor clearColor];
    _myBalance.textColor = [UIColor whiteColor];
    _myBalance.textAlignment = NSTextAlignmentLeft;
    _myBalance.text = [NSString stringWithFormat:@"%@%@",@"可用余额:",@"0"];
    [topView addSubview:_myBalance];
}

- (void)goLoginVC {
    //去登录界面
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[TheLoginVC alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//设置
- (void)goSettings {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[SettingsList alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)setDisplayView:(UIView *)displayView {
    displayView = [[UIView alloc]init];
    displayView.frame = CGRectMake(0, SCREEN_WIDTH/2, SCREEN_WIDTH, SCREEN_WIDTH * 50/320);
    displayView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:displayView];
    
    _points = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, SCREEN_WIDTH * 50/320)];
    _points.textAlignment = NSTextAlignmentCenter;
    _points.textColor = [UIColor blackColor];
    _points.numberOfLines = 0;
    _points.font = [UIFont systemFontOfSize:15.0f];
    _points.text = @"0\n可用积分";
    [displayView addSubview:_points];
    
    UILabel * dividingLine = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3 - 1, SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 1/320, SCREEN_WIDTH * 30/320)];
    dividingLine.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [displayView addSubview:dividingLine];
    
    _coupon = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, SCREEN_WIDTH * 50/320)];
    _coupon.textAlignment = NSTextAlignmentCenter;
    _coupon.textColor = [UIColor blackColor];
    _coupon.numberOfLines = 0;
    _coupon.font = [UIFont systemFontOfSize:15.0f];
    _coupon.text = @"0\n可用优惠券";
    [displayView addSubview:_coupon];
    
    UILabel * dividingLine2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3 * 2 - 1, SCREEN_WIDTH * 10/320, SCREEN_WIDTH * 1/320, SCREEN_WIDTH * 30/320)];
    dividingLine2.backgroundColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    [displayView addSubview:dividingLine2];
    
    _balance = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3 * 2, 0, SCREEN_WIDTH/3, SCREEN_WIDTH * 50/320)];
    _balance.textAlignment = NSTextAlignmentCenter;
    _balance.textColor = [UIColor blackColor];
    _balance.numberOfLines = 0;
    _balance.font = [UIFont systemFontOfSize:15.0f];
    _balance.text = @"0.00\n可用余额";
    [displayView addSubview:_balance];
}

- (void)setOrders:(UIView *)orders {
    orders = [[UIView alloc]init];
    orders.frame = CGRectMake(0, SCREEN_WIDTH * 220/320, SCREEN_WIDTH, SCREEN_WIDTH * 40/320);
    orders.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:orders];

    _myOrders = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 100/320, SCREEN_WIDTH * 40/320)];
    _myOrders.textColor = [UIColor blackColor];
    _myOrders.textAlignment = NSTextAlignmentLeft;
    _myOrders.text = @" 我的订单";
    _myOrders.font = [UIFont systemFontOfSize:15.0f];
    [orders addSubview:_myOrders];
    
    _checkMyOrders = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH * 150/320, 0, SCREEN_WIDTH * 150/320, SCREEN_WIDTH * 40/320)];
    _checkMyOrders.textAlignment = NSTextAlignmentRight;
    _checkMyOrders.textColor = [UIColor colorWithRed:0.718 green:0.718 blue:0.718 alpha:1.00];
    _checkMyOrders.text = @"查看全部订单 >";
    _checkMyOrders.font = [UIFont systemFontOfSize:13.0f];
    [orders addSubview:_checkMyOrders];
    
    _checkOrders = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 40/320)];
    _checkOrders.backgroundColor = [UIColor clearColor];
    [_checkOrders addTarget:self action:@selector(checkMyAllOrders) forControlEvents:UIControlEventTouchUpInside];
    [orders addSubview:_checkOrders];
}

//查看全部订单
- (void)checkMyAllOrders {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[ToViewTheOrder alloc]init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)setCollectionView:(UICollectionView *)collectionView {
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    
    collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH/2 + SCREEN_WIDTH * 100/320 + SCREEN_WIDTH * 1/320, SCREEN_WIDTH, SCREEN_WIDTH/3 * 2) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[FourthCell class] forCellWithReuseIdentifier:@"FourthCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_WIDTH - 2)/3, (SCREEN_WIDTH - 1)/3);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"FourthCell";
    FourthCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell sizeToFit];
    
    if (!cell) {
        
    }
    
    cell.image.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    cell.title.text = [_titleArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:[[Footprint alloc]init] animated:YES];
            self.hidesBottomBarWhenPushed = NO;
            
            break;
         
        case 1:
            
            break;
            
        case 2:
            
            break;
            
        case 3:
            
            break;
            
        case 4:
            
            break;
            
        case 5:
            
            break;
            
        default:
            break;
    }
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

- (IBAction)checkAllOrder:(id)sender {
}
@end
