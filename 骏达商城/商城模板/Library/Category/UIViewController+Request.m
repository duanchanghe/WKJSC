//
//  UIViewController+Request.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/14.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "UIViewController+Request.h"
#import<CommonCrypto/CommonDigest.h>


@implementation UIViewController (Request)

// 修改用户手机号
- (void)changePhoneUserID:(NSString *)user_id
              PhoneNumber:(NSString *)phone
              Sms_captcha:(NSString *)sms_captcha
                    Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user_id      forKey:@"user_id"];
    [dic setObject:phone        forKey:@"phone"];
    [dic setObject:sms_captcha  forKey:@"sms_captcha"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 修改密码
//old_pwd=&opt=Auth/ChangePwd&phone=&pwd=&pwd_confirm=&sms_captcha=&timestamp=1479189525&user_id=

- (void)changePasswordUserID:(NSString *)user_id
                 OldPassword:(NSString *)old_pwd
                 NewPassword:(NSString *)pwd
             PasswordConfirm:(NSString *)pwd_confirm
                 PhoneNumber:(NSString *)phone
                  SmsCaptcha:(NSString *)sms_captcha
                       Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Auth/ChangePwd"        forKey:@"opt"];
    [dic setObject:user_id                  forKey:@"user_id"];
    [dic setObject:old_pwd                  forKey:@"old_pwd"];
    [dic setObject:pwd                      forKey:@"pwd"];
    [dic setObject:pwd_confirm              forKey:@"pwd_confirm"];
    [dic setObject:phone                    forKey:@"phone"];
    [dic setObject:sms_captcha              forKey:@"sms_captcha"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
}

// 忘记密码
//opt=Auth/GetBackPwd&phone=&pwd=&pwd_confirm=&sms_captcha=&timestamp=1479189564&user_id=
- (void)getbackPasswordUserID:(NSString *)user_id
                  NewPassword:(NSString *)pwd
              PasswordConfirm:(NSString *)pwd_confirm
                  PhoneNumber:(NSString *)phone
                   SmsCaptcha:(NSString *)sms_captcha
                        Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Auth/GetBackPwd"     forKey:@"opt"];
    [dic setObject:user_id           forKey:@"user_id"];
    [dic setObject:pwd         forKey:@"pwd"];
    [dic setObject:pwd_confirm           forKey:@"pwd_confirm"];
    [dic setObject:phone         forKey:@"phone"];
    [dic setObject:sms_captcha           forKey:@"sms_captcha"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
}

// 用户第三方登入
//opt=Auth/LoginSNS
- (void)loginSNSIcon:(NSString *)icon
            Platform:(NSString *)platform
      RegistrationID:(NSString *)regustration_id
               UmUid:(NSString *)um_uid
            Username:(NSString *)username
               Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Auth/LoginSNS"     forKey:@"opt"];
    [dic setObject:icon                 forKey:@"icon"];
    [dic setObject:platform             forKey:@"platform"];
    [dic setObject:regustration_id      forKey:@"regustration_id"];
    [dic setObject:um_uid               forKey:@"um_uid"];
    [dic setObject:username             forKey:@"username"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
}


// 用户登入
//opt=Auth/Login
- (void)loginPassword:(NSString *)pwd
       RegistrationID:(NSString *)regustration_id
                 Type:(NSString *)type
             UserInfo:(NSString *)user_info
                Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Auth/Login"     forKey:@"opt"];
    [dic setObject:pwd           forKey:@"pwd"];
    [dic setObject:regustration_id         forKey:@"regustration_id"];
    [dic setObject:type           forKey:@"type"];
    [dic setObject:user_info         forKey:@"user_info"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}



// 用户注册
//opt=Auth/Register&phone=sys_admin&pwd=123456&registration_id=&sms_captcha=
- (void)registerPhonenumber:(NSString *)phone
                   Password:(NSString *)pwd
             RegsitrationID:(NSString *)registration_id
                 SmaCaptcha:(NSString *)sms_captcha
                      Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Auth/Register"         forKey:@"opt"];
    [dic setObject:phone                    forKey:@"phone"];
    [dic setObject:pwd                      forKey:@"pwd"];
    [dic setObject:registration_id          forKey:@"registration_id"];
    [dic setObject:sms_captcha              forKey:@"sms_captcha"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
    
}

// 发送验证码
//opt=Auth/SendCaptcha&phone=
- (void)SendCaptchaPhoneNumber:(NSString *)phone
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"OAuth/SendCaptcha"     forKey:@"opt"];
    [dic setObject:phone                    forKey:@"phone"];
}



// 商品分类
//mer_id=1&opt=Goods/Catalog&&type=
- (void)catalogType:(NSString *)type
              Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"opt=Goods/Catalog"     forKey:@"opt"];
    [dic setObject:[self getMerID]          forKey:@"mer_id"];
    [dic setObject:type                     forKey:@"type"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 商品详情
//goods_id=1&mer_id=1&opt=Goods/Detail
- (void)detailGoodsID:(NSString *)goods_id
                Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/Detail"      forKey:@"opt"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:goods_id             forKey:@"goods_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
    
}

// 商品添加/取消收藏
//goods_id=&opt=Goods/Favorites
- (void)favoritesGoodsID:(NSString *)goods_id
                   Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/Favorites"       forKey:@"opt"];
    [dic setObject:[self getToken]          forKey:@"token"];
    [dic setObject:goods_id                 forKey:@"goods_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 商品列表
//catalog=&currency=cny&keyword=&mer_id=1&opt=Goods/List&order=ASC&page=1&page_size=6&sort=sort
- (void)listPage:(NSString *)page
        Pagesize:(NSString *)page_size
         KeyWord:(NSString *)keyword
         Catalog:(NSString *)catalog
        Currency:(NSString *)currency
            Sort:(NSString *)sort
           Order:(NSString *)order
           Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/List"        forKey:@"opt"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:page                 forKey:@"page"];
    [dic setObject:page_size            forKey:@"page_size"];
    [dic setObject:keyword              forKey:@"keyword"];
    [dic setObject:catalog              forKey:@"catalog"];
    [dic setObject:currency             forKey:@"currency"];
    [dic setObject:sort                 forKey:@"sort"];
    [dic setObject:order                forKey:@"order"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 商品积分列表
//opt=Goods/Points&order=ASC&page=1&page_size=6&sort=sort
- (void)pointsPage:(NSString *)page
          Pagesize:(NSString *)page_size
              Sort:(NSString *)sort
             Order:(NSString *)order
             Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/Points"      forKey:@"opt"];
    [dic setObject:page                 forKey:@"page"];
    [dic setObject:page_size            forKey:@"page_size"];
    [dic setObject:sort                 forKey:@"sort"];
    [dic setObject:order                forKey:@"order"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 商品搜索
//catalog=&keyword=&mer_id=1&opt=Goods/Search
- (void)searchCatalog:(NSString *)catalog
              Keyword:(NSString *)keyword
                Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/Search"          forKey:@"opt"];
    [dic setObject:[self getMerID]          forKey:@"mer_id"];
    [dic setObject:catalog                  forKey:@"catalog"];
    [dic setObject:keyword                  forKey:@"keyword"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 获取限时促销商品
//mer_id=1&opt=Goods/TimeSale&order_by=created_at desc
- (void)timeSaleOrderBy:(NSString *)order_by
                  Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Goods/TimeSale"        forKey:@"opt"];
    [dic setObject:[self getMerID]          forKey:@"mer_id"];
    [dic setObject:order_by                 forKey:@"order_by"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
    
}

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
             Block:(void(^)(NSMutableDictionary *data))block
{
    NSString *data = [NSString stringWithFormat:@"[{\"id\":%@,\"qty\":%@}]",ID,qty];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Order/Create"      forKey:@"opt"];
    [dic setObject:[self getToken]      forKey:@"token"];
    [dic setObject:type                 forKey:@"type"];
    [dic setObject:currency             forKey:@"currency"];
    [dic setObject:pay_channel          forKey:@"pay_channel"];
    [dic setObject:address_id           forKey:@"address_id"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:coipon_id            forKey:@"coipon_id"];
    [dic setObject:bucks                forKey:@"bucks"];
    [dic setObject:user_remark          forKey:@"user_remark"];
    [dic setObject:data                 forKey:@"data"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 获取订单支付 charge
//mer_id=1&opt=Order/GetCharge&order_id=
- (void)getChangeOrderID:(NSString *)order_id
                   Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Order/GetCharge"       forKey:@"opt"];
    [dic setObject:[self getMerID]          forKey:@"mer_id"];
    [dic setObject:order_id                 forKey:@"order_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 订单准备
//currency=cny&goods=[{"id":"7","qty":"1"}]&opt=Order/Prepare&type=goods

- (void)prepareType:(NSString *)type
           Currency:(NSString *)currency
              Goods:(NSArray <NSArray *>*)goods
              Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableString *Goods = [NSMutableString stringWithFormat:@"["];
    for (int i = 0; i < goods.count; i++) {
        NSArray *temp = goods[i];
        [Goods appendFormat:@"{\"id\":%@,\"qty\":%@}",temp[0],temp[1]];
        
        if (i < goods.count - 1) {
            [Goods appendString:@","];
        }
    }
    [Goods appendString:@"]"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Order/Prepare"     forKey:@"opt"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:[self getToken]      forKey:@"token"];
    [dic setObject:type                 forKey:@"type"];
    [dic setObject:currency             forKey:@"currency"];
    [dic setObject:Goods                 forKey:@"goods"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 首页
- (void)homeOrderBy:(NSString *)order_by
              Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"Page/Home"         forKey:@"opt"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:order_by             forKey:@"order_by"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 系统区域
//opt=System/Area&pid=0
- (void)areaPid:(NSString *)pid
          Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"System/Area"     forKey:@"opt"];
    [dic setObject:pid           forKey:@"pid"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

#pragma mark -- 上传
// 文件上传 post
//opt=System/FileUpload&path=icon&type=img
- (void)fileUploadFileData:(NSData *)file_data
                      Type:(NSString *)type
                      Path:(NSString *)path
                     Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"System/FileUpload"     forKey:@"opt"];
    [dic setObject:file_data                forKey:@"file_data"];
    [dic setObject:type                     forKey:@"type"];
    [dic setObject:path                     forKey:@"path"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 系统信息
//opt=System/Info
- (void)infoBlock:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"System/Info"    forKey:@"opt"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 查询用户收藏
//opt=User/Favorites&type=goods&user_id=
- (void)userFavoritesUserID:(NSString *)user_id
                       Type:(NSString *)type
                      Block:(void (^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/Favorites"            forKey:@"opt"];
    [dic setObject:[self getToken]              forKey:@"token"];
    [dic setObject:user_id                      forKey:@"user_id"];
    [dic setObject:type                         forKey:@"type"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 获取足迹
//opt=User/HistoryList&user_id=
- (void)userHistoryListUserID:(NSString *)user_id
                        Block:(void (^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/HistoryList"    forKey:@"opt"];
    [dic setObject:user_id                forKey:@"user_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 增加足迹
//goods_id=&opt=User/History
- (void)userHistoryUserID:(NSString *)user_id
                  GoodsID:(NSString *)goods_id
                    Block:(void (^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/History"      forKey:@"opt"];
    [dic setObject:user_id              forKey:@"user_id"];
    [dic setObject:goods_id             forKey:@"goods_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 读取或修改用户信息
//key=icon&opt=User/Info
- (void)UserInfoKey:(NSString *)key
              Value:(NSString *)value
              Block:(void (^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/Info"         forKey:@"opt"];
    [dic setObject:[self getToken]      forKey:@"token"];
    [dic setObject:key                  forKey:@"key"];
    [dic setObject:value                forKey:@"value"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 用户佣金
//opt=User/List&timestamp=1479129078&user_id=
- (void)userListUserID:(NSString *)user_id
                 Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/List"     forKey:@"opt"];
    [dic setObject:user_id          forKey:@"user_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
}

// 通过用户随机码获取订单
//opt=User/OrderByCode&ran_code=
- (void)OrderByCodeRanCode:(NSString *)ran_code
                     Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/OrderByCode"      forKey:@"opt"];
    [dic setObject:ran_code                 forKey:@"ran_code"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 用户订单
//mer_id=1&opt=User/Order&page=1&page_size=6&status=0
- (void)userOrderStatus:(NSString *)status
                   Page:(NSString *)page
               PageSize:(NSString *)page_size
                  Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/Order"        forKey:@"opt"];
    [dic setObject:[self getToken]      forKey:@"token"];
    [dic setObject:status               forKey:@"status"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [dic setObject:page                 forKey:@"page"];
    [dic setObject:page_size            forKey:@"page_size"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
}

// 增加积分
//num=0&opt=User/Point
- (void)userPointUserID:(NSString *)user_id
                 Number:(NSString *)num
                  Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"User/Point"            forKey:@"opt"];
    [dic setObject:user_id                  forKey:@"user_id"];
    [dic setObject:num                      forKey:@"num"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 创建用户地址
//address=&area_id=2260&name=&opt=UserAddress/Create&phone=&postcode=
- (void)addressCreateName:(NSString *)name
                    Phone:(NSString *)phone
                   AreaID:(NSString *)area_id
                  Address:(NSString *)address
                 Postcode:(NSString *)psotcode
                    Bolck:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserAddress/Create"    forKey:@"opt"];
    [dic setObject:[self getToken]          forKey:@"token"];
    [dic setObject:name                     forKey:@"name"];
    [dic setObject:phone                    forKey:@"phone"];
    [dic setObject:area_id                  forKey:@"area_id"];
    [dic setObject:address                  forKey:@"address"];
    [dic setObject:psotcode                 forKey:@"psotcode"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 删除用户地址
//id=&opt=UserAddress/Destroy
- (void)addressDestroyAddressID:(NSString *)ID
                          Bolck:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserAddress/Destroy"    forKey:@"opt"];
    [dic setObject:[self getToken]           forKey:@"token"];
    [dic setObject:ID                        forKey:@"id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 获取用户收货地址
//opt=UserAddress/List
- (void)addressListBlock:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserAddress/List"    forKey:@"opt"];
    [dic setObject:[self getToken]        forKey:@"token"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 修改用户收货地址
//address=&area_id=&id=&is_default=0&name=&opt=UserAddress/Update&phone=&postcode=
- (void)addressUpdateAddressID:(NSString *)ID
                     IsDefault:(NSString *)is_default
                       address:(NSString *)address
                      Postcode:(NSString *)postcode
                         Block:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserAddress/Update"    forKey:@"opt"];
    [dic setObject:[self getToken]          forKey:@"token"];
    [dic setObject:ID                       forKey:@"id"];
    [dic setObject:is_default               forKey:@"is_default"];
    [dic setObject:address                  forKey:@"address"];
    [dic setObject:postcode                 forKey:@"postcode"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}


// 清空收货地址
//mer_id=1&opt=UserCart/Destroy
- (void)cartDestroyBlock:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserCart/Destroy"    forKey:@"opt"];
    [dic setObject:[self getToken]        forKey:@"token"];
    [dic setObject:[self getMerID]        forKey:@"mer_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
    
}

// 添加到购物车
//goods=[{"id":"","qty":""}]&mer_id=1&opt=UserCart/Insert
- (void)cartInsertGoodsID:(NSString *)ID
                 GoodsQty:(NSString *)qty
                    Block:(void(^)(NSMutableDictionary *data))block
{
    NSString *data = [NSString stringWithFormat:@"[{\"id\":%@,\"qty\":%@}]",ID,qty];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserCart/Insert"     forKey:@"opt"];
    [dic setObject:[self getToken]        forKey:@"token"];
    [dic setObject:[self getMerID]        forKey:@"mer_id"];
    [dic setObject:data                   forKey:@"data"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
    
}

// 获取购物车
//mer_id=1&opt=UserCart/List
- (void)cartListBlock:(void(^)(NSMutableDictionary *data))block
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserCart/List"     forKey:@"opt"];
    [dic setObject:[self getToken]      forKey:@"token"];
    [dic setObject:[self getMerID]      forKey:@"mer_id"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 更新购物车
//data=[{"id":"","qty":""}]&mer_id=1&opt=UserCart/Update
- (void)cartUpdateGoodsID:(NSString *)ID
                 GoodsQty:(NSString *)qty
                    Block:(void(^)(NSMutableDictionary *))block
{
    
    NSString *data = [NSString stringWithFormat:@"[{\"id\":%@,\"qty\":%@}]",ID,qty];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"UserCart/Update"     forKey:@"opt"];
    [dic setObject:[self getMerID]        forKey:@"mer_id"];
    [dic setObject:[self getToken]        forKey:@"token"];
    [dic setObject:data                   forKey:@"data"];
    [self getParmar:dic Block:^(NSMutableDictionary *temp) {
        block(temp);
    }];
}

// 获取 token
- (NSString *)getToken
{
    NSString *token;
//    token = @"487108ea010ee6507e58693f5c1899ac";

    token = @"46504168e4794b30bb3bd8f3a8bd14e6";
    
    return token;
}

// 获取 mer_id
- (NSString *)getMerID
{
    NSString *mer_id;
    mer_id = @"1";
    
    return mer_id;
}



-(void)getParmar:(NSMutableDictionary*)parmar
            Block:(void(^)(NSMutableDictionary*temp))block;
{
    NSDate *senddate = [NSDate date];
    NSString *date2 = [NSString stringWithFormat:@"%ld", (long)[senddate timeIntervalSince1970]];

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-os"];
    [session.requestSerializer setValue:@"8.0.0" forHTTPHeaderField:@"client-os-ver"];
    [session.requestSerializer setValue:@"1.0.0" forHTTPHeaderField:@"client-ver"];
    [session.requestSerializer setValue:@"V1" forHTTPHeaderField:@"api-ver"];
    [session.requestSerializer setValue:date2 forHTTPHeaderField:@"timestamp"];
    [parmar setObject:date2 forKey:@"timestamp"];
    NSArray *allKeys = [parmar allKeys];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:nil ascending:YES];
    NSArray *sortArray = [NSArray arrayWithObjects:descriptor,nil];
    NSArray *sortedArray = [allKeys sortedArrayUsingDescriptors:sortArray];
    NSString* str = @"";
    for (int i = 0; i < sortedArray.count; i ++) {
        NSString*sf = [sortedArray objectAtIndex:i];
        NSString *sfg = [sortedArray objectAtIndex:i];
        str = [str stringByAppendingString:sfg];
        NSString*sktt = (NSString*)[parmar objectForKey:sf];
        str = [str stringByAppendingString:@"="];
        str = [str stringByAppendingString:sktt];
        str = [str stringByAppendingString:@"&"];
    }
    
    str = [str stringByAppendingString:@"secret=junda_signature_key"];
    NSString *output = [self md5:str];
    [session.requestSerializer setValue:output forHTTPHeaderField:@"signature"];
    [session POST:URI parameters:parmar progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableDictionary * dic = (NSMutableDictionary*) responseObject;
        
        
        if ([dic[@"code"] integerValue]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:dic[@"msg"]
                                                           delegate:nil
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"确定", nil];
            [alert show];
            
        }
        
        block(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:[NSString stringWithFormat:@"%@",error]
                                                       delegate:nil
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
        [alert show];
        
    }];
    
}


- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}





@end
