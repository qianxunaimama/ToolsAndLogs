//
//  QSProductInfoModel.m
//  TGY
//
//  Created by zhangwei on 16/7/27.
//  Copyright © 2016年 qiushi. All rights reserved.
//

#import "QSProductInfoModel.h"
#import <objc/runtime.h>
@implementation QSProductInfoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"netvalues" : [Netvalues class], @"otherFiles" : [Otherfiles class]};
}

+ (NSArray *)propertyOfSelf
{
    unsigned int count;
    
    // 1. 获得类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    NSMutableArray *properNames =[NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        // 2.获得成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 3.除去下划线，从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        
        
        
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];

        NSLog(@"ivar ---- %@  %tu",type,type.length);
        if (type.length > 1) {
            [properNames addObject:key];
        }
    }
    
    return [properNames copy];
}

- (void)autoSetNSNull
{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
    
        // 创建指向get方法
        SEL getSel = NSSelectorFromString(propertyName);
        // 对每一个属性实现归档
        IMP imp = [self methodForSelector: getSel];
        id (*func)(id, SEL) = (void *)imp;
        
        
        
        
        NSLog(@"test objcet %@",propertyName);
        id object = func(self, getSel);
        
        
        NSLog(@"%@ ---- %@",propertyName, [object class]);

        if (!object) {
            NSLog(@"%@ is null rep  NSNull",propertyName);
            // 1.获取属性名的第一个字符，变为大写字母
            NSString *firstCharater = [propertyName substringToIndex:1].uppercaseString;
            // 2.替换掉属性名的第一个字符为大写字符，并拼接出set方法的方法名
            NSString *setPropertyName = [NSString stringWithFormat:@"set%@%@:",firstCharater,[propertyName substringFromIndex:1]];
            SEL setSel = NSSelectorFromString(setPropertyName);
            IMP impSet = [self methodForSelector: setSel];
            void (*funcSet)(id, SEL, id) = (void *)impSet;
            funcSet(self, setSel, [NSNull null]);
        }
    }
}


@end

@implementation Basicfile

@end


@implementation Netvalues

@end


@implementation Otherfiles

@end


