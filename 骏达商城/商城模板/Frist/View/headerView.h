//
//  headerView.h
//  Ds_love
//
//  Created by By_smileds on 16/11/23.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectBtnView.h"

@interface headerView : UICollectionReusableView
@property (strong, nonatomic) void(^sellectType)(SelectBtnView *btnView, int times);
@property (copy, nonatomic) SelectBtnView *btnView;
@end
