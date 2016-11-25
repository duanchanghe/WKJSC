//
//  UIViewController+Request.h
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/14.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Request)

// 修改用户手机号
- (void)changePhoneUserID:(NSString *)user_id
              PhoneNumber:(NSString *)phone
              Sms_captcha:(NSString *)sms_captcha
                    Block:(void(^)(NSMutableDictionary *data))block;

// 修改密码
- (void)changePasswordUserID:(NSString *)user_id
                 OldPassword:(NSString *)old_pwd
                 NewPassword:(NSString *)pwd
             PasswordConfirm:(NSString *)pwd_confirm
                 PhoneNumber:(NSString *)phone
                  SmsCaptcha:(NSString *)sms_captcha
                       Block:(void(^)(NSMutableDictionary *data))block;

// 忘记密码
- (void)getbackPasswordUserID:(NSString *)user_id
                  NewPassword:(NSString *)pwd
              PasswordConfirm:(NSString *)pwd_confirm
                  PhoneNumber:(NSString *)phone
                   SmsCaptcha:(NSString *)sms_captcha
                        Block:(void(^)(NSMutableDictionary *data))block;

// 用户第三方登入
//opt=Auth/LoginSNS
- (void)loginSNSIcon:(NSString *)icon
            Platform:(NSString *)platform
      RegistrationID:(NSString *)regustration_id
               UmUid:(NSString *)um_uid
            Username:(NSString *)username
               Block:(void(^)(NSMutableDictionary *data))block;

// 用户登入
//opt=Auth/Login
- (void)loginPassword:(NSString *)pwd
       RegistrationID:(NSString *)regustration_id
                 Type:(NSString *)type
             UserInfo:(NSString *)user_info
                Block:(void(^)(NSMutableDictionary *data))block;

// 用户注册
//opt=Auth/Register&phone=sys_admin&pwd=123456&registration_id=&sms_captcha=
- (void)registerPhonenumber:(NSString *)phone
                   Password:(NSString *)pwd
             RegsitrationID:(NSString *)registration_id
                 SmaCaptcha:(NSString *)sms_captcha
                      Block:(void(^)(NSMutableDictionary *data))block;

// 发送验证码
//opt=Auth/SendCaptcha&phone=
- (void)SendCaptchaPhoneNumber:(NSString *)phone;

// 商品分类
//mer_id=1&opt=Goods/Catalog&&type=
- (void)catalogType:(NSString *)type
              Block:(void(^)(NSMutableDictionary *data))block;

// 商品详情
//goods_id=1&mer_id=1&opt=Goods/Detail
- (void)detailGoodsID:(NSString *)goods_id
                Block:(void(^)(NSMutableDictionary *data))block;

// 商品添加/取消收藏
//goods_id=&opt=Goods/Favorites
- (void)favoritesGoodsID:(NSString *)goods_id
                   Block:(void(^)(NSMutableDictionary *data))block;

// 商品列表
//catalog=&currency=cny&keyword=&mer_id=1&opt=Goods/List&order=ASC&page=1&page_size=6&sort=sort
- (void)listPage:(NSString *)page
        Pagesize:(NSString *)page_size
         KeyWord:(NSString *)keyword
         Catalog:(NSString *)catalog
        Currency:(NSString *)currency
            Sort:(NSString *)sort
           Order:(NSString *)order
           Block:(void(^)(NSMutableDictionary *data))block;

// 商品积分列表
//opt=Goods/Points&order=ASC&page=1&page_size=6&sort=sort
- (void)pointsPage:(NSString *)page
          Pagesize:(NSString *)page_size
              Sort:(NSString *)sort
             Order:(NSString *)order
             Block:(void(^)(NSMutableDictionary *data))block;

// 商品搜索
//catalog=&keyword=&mer_id=1&opt=Goods/Search
- (void)searchCatalog:(NSString *)catalog
              Keyword:(NSString *)keyword
                Block:(void(^)(NSMutableDictionary *data))block;

// 获取限时促销商品
//mer_id=1&opt=Goods/TimeSale&order_by=created_at desc
- (void)timeSaleOrderBy:(NSString *)order_by
                  Block:(void(^)(NSMutableDictionary *data))block;

// 生成订单
//address_id=&bucks=0&coupon_id=0&currency=cny&goods=[{"id":"","qty":""}]&mer_id=1&opt=Order/Create&pay_channel=alipay&type=goods&user_remark=
- (void)createType:(NSString *)type
          Currency:(NSString *)currency
        PayChannel:(NSString *)pay_channel
         AddressID:(NSString *)address_id
          CouponID:(NSString *)coipon_id
             Bucks:(NSString *)bucks
        UserRemark:(NSString *)user_remark
           GoodsID:(NSString *)ID
          GoodsQty:(NSString *)qty
             Block:(void(^)(NSMutableDictionary *data))block;

// 获取订单支付 charge
//mer_id=1&opt=Order/GetCharge&order_id=
- (void)getChangeOrderID:(NSString *)order_id
                   Block:(void(^)(NSMutableDictionary *data))block;


// 订单准备
//currency=cny&goods=[{"id":"","qty":""}]&mer_id=1&opt=Order/Prepare&type=goods
// goods的格式为 @[@[@"商品 id",@"商品数量 "],@[@"商品 id",@"商品 id"]];
- (void)prepareType:(NSString *)type
           Currency:(NSString *)currency
              Goods:(NSArray <NSArray *>*)goods
              Block:(void(^)(NSMutableDictionary *data))block;


// 首页
- (void)homeOrderBy:(NSString *)order_by
              Block:(void(^)(NSMutableDictionary *data))block;


// 系统区域
//opt=System/Area&pid=0
- (void)areaPid:(NSString *)pid
          Block:(void(^)(NSMutableDictionary *data))block;

// 文件上传 post
//opt=System/FileUpload&path=icon&type=img
- (void)fileUploadFileData:(NSData *)file_data
                      Type:(NSString *)type
                      Path:(NSString *)path
                     Block:(void(^)(NSMutableDictionary *data))block;



// 系统信息
//opt=System/Info
- (void)infoBlock:(void(^)(NSMutableDictionary *data))block;


// 查询用户收藏
//opt=User/Favorites&type=goods&user_id=
- (void)userFavoritesUserID:(NSString *)user_id
                       Type:(NSString *)type
                      Block:(void (^)(NSMutableDictionary *data))block;


// 获取足迹
//opt=User/HistoryList&user_id=
- (void)userHistoryListUserID:(NSString *)user_id
                        Block:(void (^)(NSMutableDictionary *data))block;

// 增加足迹
//goods_id=&opt=User/History
- (void)userHistoryUserID:(NSString *)user_id
                  GoodsID:(NSString *)goods_id
                    Block:(void (^)(NSMutableDictionary *data))block;

// 读取或修改用户信息
//key=icon&opt=User/Info
- (void)UserInfoKey:(NSString *)key
              Value:(NSString *)value
              Block:(void (^)(NSMutableDictionary *data))block;

// 用户佣金
//opt=User/List&timestamp=1479129078&user_id=
- (void)userListUserID:(NSString *)user_id
                 Block:(void(^)(NSMutableDictionary *data))block;

// 通过用户随机码获取订单
//opt=User/OrderByCode&ran_code=
- (void)OrderByCodeRanCode:(NSString *)ran_code
                     Block:(void(^)(NSMutableDictionary *data))block;

// 用户订单
//mer_id=1&opt=User/Order&page=1&page_size=6&status=0
- (void)userOrderStatus:(NSString *)status
                   Page:(NSString *)page
               PageSize:(NSString *)page_size
                  Block:(void(^)(NSMutableDictionary *data))block;

// 增加积分
//num=0&opt=User/Point
- (void)userPointUserID:(NSString *)user_id
                 Number:(NSString *)num
                  Block:(void(^)(NSMutableDictionary *data))block;

// 创建用户地址
//address=&area_id=2260&name=&opt=UserAddress/Create&phone=&postcode=
- (void)addressCreateName:(NSString *)name
                    Phone:(NSString *)phone
                   AreaID:(NSString *)area_id
                  Address:(NSString *)address
                 Postcode:(NSString *)psotcode
                    Bolck:(void(^)(NSMutableDictionary *data))block;

// 删除用户地址
//id=&opt=UserAddress/Destroy
- (void)addressDestroyAddressID:(NSString *)ID
                          Bolck:(void(^)(NSMutableDictionary *data))block;
// 获取用户收货地址
//opt=UserAddress/List
- (void)addressListBlock:(void(^)(NSMutableDictionary *data))block;

// 修改用户收货地址
//address=&area_id=&id=&is_default=0&name=&opt=UserAddress/Update&phone=&postcode=
- (void)addressUpdateAddressID:(NSString *)ID
                     IsDefault:(NSString *)is_default
                       address:(NSString *)address
                      Postcode:(NSString *)postcode
                         Block:(void(^)(NSMutableDictionary *data))block;

// 清空收货地址
//mer_id=1&opt=UserCart/Destroy
- (void)cartDestroyBlock:(void(^)(NSMutableDictionary *data))block;

// 添加到购物车
//goods=[{"id":"","qty":""}]&mer_id=1&opt=UserCart/Insert
- (void)cartInsertGoodsID:(NSString *)ID
                 GoodsQty:(NSString *)qty
                    Block:(void(^)(NSMutableDictionary *data))block;

// 获取购物车
//mer_id=1&opt=UserCart/List
- (void)cartListBlock:(void(^)(NSMutableDictionary *data))block;

// 更新购物车
//data=[{"id":"","qty":""}]&mer_id=1&opt=UserCart/Update
- (void)cartUpdateGoodsID:(NSString *)ID
                 GoodsQty:(NSString *)qty
                    Block:(void(^)(NSMutableDictionary *))block;

// 获取 token
- (NSString *)getToken;

// 获取 mer_id
- (NSString *)getMerID;

@end
