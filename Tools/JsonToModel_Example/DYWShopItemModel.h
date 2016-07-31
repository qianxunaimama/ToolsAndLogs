//
//  DYWShopItemModel.h
//  DYW-Seller
//
//  Created by 疯兔 on 15/10/11.
//  Copyright © 2015年 DYW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DYWShopItemModel : NSObject
NS_ASSUME_NONNULL_BEGIN;
@property(nonatomic,copy)NSString *img_01;
@property(nonatomic,copy)NSString *img_02;
@property(nonatomic,copy)NSString *img_03;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *stock;
@property(nonatomic,copy)NSString *spec;
@property(nonatomic,copy)NSString *t_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSNumber *hight;
@property(nonatomic,strong)NSNumber *status;
+(instancetype)shopItemModelWithDict:(NSDictionary *)dict;

@end
NS_ASSUME_NONNULL_END;

