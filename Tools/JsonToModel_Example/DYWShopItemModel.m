//
//  DYWShopItemModel.m
//  DYW-Seller
//
//  Created by 疯兔 on 15/10/11.
//  Copyright © 2015年 DYW. All rights reserved.
//

#import "DYWShopItemModel.h"

@implementation DYWShopItemModel
+(instancetype)shopItemModelWithDict:(NSDictionary *)dict
{
    return [[DYWShopItemModel alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
