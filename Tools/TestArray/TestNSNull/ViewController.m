//
//  ViewController.m
//  TestNSNull
//
//  Created by zhangwei on 16/7/29.
//  Copyright © 2016年 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "QSProductInfoModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    QSProductInfoModel *model = [QSProductInfoModel new];
    model.productCategoryId = 1;
    [model autoSetNSNull];
    NSLog(@"%@ %tu",model.raiseAmountLeft,model.productCategoryId);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
