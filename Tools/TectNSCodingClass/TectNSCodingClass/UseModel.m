//
//  UseModel.m
//  TectNSCodingClass
//
//  Created by zhangwei on 16/7/12.
//  Copyright © 2016年 Mr.Z. All rights reserved.
//

#import "UseModel.h"
#import <objc/runtime.h>

@implementation UseModel
// 归档

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        // 创建指向get方法
        SEL getSel = NSSelectorFromString(propertyName);
        // 对每一个属性实现归档
        
        
        IMP imp = [self methodForSelector: getSel];
        id (*func)(id, SEL) = (void *)imp;
        id object = func(self, getSel);
        
        NSLog(@"object %@ - %@",object,propertyName);
        [aCoder encodeObject:object  forKey:propertyName];
    }
}

// 解档
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
        // 取得所有成员变量名
        NSArray *properNames = [[self class] propertyOfSelf];
        
        for (NSString *propertyName in properNames) {
            // 创建指向属性的set方法
            // 1.获取属性名的第一个字符，变为大写字母
            NSString *firstCharater = [propertyName substringToIndex:1].uppercaseString;
            // 2.替换掉属性名的第一个字符为大写字符，并拼接出set方法的方法名
            NSString *setPropertyName = [NSString stringWithFormat:@"set%@%@:",firstCharater,[propertyName substringFromIndex:1]];
            
            SEL setSel = NSSelectorFromString(setPropertyName);
            IMP imp = [self methodForSelector: setSel];
            void (*func)(id, SEL, id) = (void *)imp;
            func(self, setSel, [aDecoder decodeObjectForKey:propertyName]);
            
        }
        return  self;
    
}

- (NSString *)description{
    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n"];
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    for (NSString *propertyName in properNames) {
        // 创建指向get方法
        SEL getSel = NSSelectorFromString(propertyName);
        IMP imp = [self methodForSelector: getSel];
        id (*func)(id, SEL) = (void *)imp;
        id object = func(self, getSel);

        
        NSString *propertyNameString = [NSString stringWithFormat:@"%@ - %@\n",propertyName, object];
        [descriptionString appendString:propertyNameString];
    }
    return [descriptionString copy];
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
        
        [properNames addObject:key];
    }
    
    return [properNames copy];
}
@end
