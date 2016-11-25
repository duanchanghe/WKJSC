//
//  SelectBtnView.h
//  Ds_love
//
//  Created by By_smileds on 16/11/23.
//  Copyright © 2016年 By_smileds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectBtnView : UIView
@property (copy, nonatomic) NSString *btnTitle;
@property (assign, nonatomic) BOOL rightImaIsHidden;
@property (assign, nonatomic) BOOL rightViewIsHidden;
@property (assign, nonatomic) CGFloat angle;
@property (strong, nonatomic) void(^btnAction)(SelectBtnView *btnView);

@end
