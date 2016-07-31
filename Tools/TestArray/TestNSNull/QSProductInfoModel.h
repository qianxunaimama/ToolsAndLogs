//
//  QSProductInfoModel.h
//  TGY
//
//  Created by zhangwei on 16/7/27.
//  Copyright © 2016年 qiushi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Basicfile,Netvalues,Otherfiles;
@interface QSProductInfoModel : NSObject
+ (NSDictionary *)objectClassInArray;
- (void)autoSetNSNull;

@property (nonatomic, copy) NSString *subscribeMinAmount;

@property (nonatomic, copy) NSString *productLightspot;

@property (nonatomic, copy) NSString *raiseBank;

@property (nonatomic, copy) NSString *expectAnnualizedRateBetween;

@property (nonatomic, copy) NSString *trusteeRate;

@property (nonatomic, copy) NSString *raiseAmount;

@property (nonatomic, copy) NSString *investmentArea;

@property (nonatomic, copy) NSString *financingUserName;

@property (nonatomic, copy) NSString *payRemark;

@property (nonatomic, copy) NSString *raiseAccount;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *expectAnnualizedRates;

@property (nonatomic, copy) NSString *excessSalaryRate;

@property (nonatomic, copy) NSString *trustee;

@property (nonatomic, strong) Basicfile *basicFile;

@property (nonatomic, copy) NSString *payment;

@property (nonatomic, copy) NSString *productScale;

@property (nonatomic, strong) NSArray<Otherfiles *> *otherFiles;

@property (nonatomic, assign) NSInteger productType;

@property (nonatomic, copy) NSString *productTerm;

@property (nonatomic, copy) NSString *raiseAmountLeft;

@property (nonatomic, assign) NSInteger productCategoryId;

@property (nonatomic, copy) NSString *setUpScale;

@property (nonatomic, copy) NSString *increaseAmount;

@property (nonatomic, copy) NSString *subscribeRate;

@property (nonatomic, copy) NSString *closedPeriod;

@property (nonatomic, assign) NSInteger publishStatus;

@property (nonatomic, copy) NSString *raiseAccountName;

@property (nonatomic, copy) NSString *productName;

@property (nonatomic, strong) NSArray<Netvalues *> *netvalues;

@property (nonatomic, assign) NSInteger productStatus;

@property (nonatomic, assign) NSInteger productId;

@property (nonatomic, copy) NSString *recommendReason;

@property (nonatomic, copy) NSString *conductor;

@end
@interface Basicfile : NSObject

@property (nonatomic, assign) NSInteger productFileId;

@property (nonatomic, copy) NSString *fileName;

@property (nonatomic, copy) NSString *types;

@property (nonatomic, assign) NSInteger productId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger type;

@end

@interface Netvalues : NSObject

@property (nonatomic, strong) NSNumber *netvalueAddup;

@property (nonatomic, strong) NSNumber *netvalueUnit;

@property (nonatomic, assign) NSInteger productId;

@property (nonatomic, copy) NSString *day;

@property (nonatomic, assign) NSInteger productNetvalueId;

@end

@interface Otherfiles : NSObject

@property (nonatomic, assign) NSInteger productFileId;

@property (nonatomic, copy) NSString *fileName;

@property (nonatomic, copy) NSString *types;

@property (nonatomic, assign) NSInteger productId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger type;

@end

