//
//  UseModel.h
//  TectNSCodingClass
//
//  Created by zhangwei on 16/7/12.
//  Copyright © 2016年 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UseModel : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *token;
@property(nonatomic,copy)NSString *password;
+ (NSArray *)propertyOfSelf;
@end
