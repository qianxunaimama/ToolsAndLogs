//
//  TestModel.h
//  TestNSNull
//
//  Created by zhangwei on 16/7/29.
//  Copyright © 2016年 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
- (instancetype)autoSetNSNull;

@property (nonatomic, copy) NSString *raiseAmountLeft;
@property (nonatomic, assign) NSInteger productCategoryId;
@end
