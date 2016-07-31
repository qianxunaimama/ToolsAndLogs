//
//  ViewController.m
//  TectNSCodingClass
//
//  Created by zhangwei on 16/7/12.
//  Copyright © 2016年 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "UseModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UseModel * model = [[UseModel alloc]init];
    model.name = @"zhangwei";
    
    NSString *multiHome = [self GetThefilePath:@"multi.archiver"];

    
    BOOL ok =  [NSKeyedArchiver archiveRootObject:model toFile: multiHome];

    if (ok) {
        NSLog(@"ok");
        
        // 从file存档中解析对象到student中
        UseModel *test = [NSKeyedUnarchiver unarchiveObjectWithFile:multiHome];
        
        NSLog(@"%@",test.description);

    }else{
        NSLog(@"no");

    }
    
}
-(NSString *)GetThefilePath:(NSString *)filePath{
    NSString *Path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                           NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:filePath];
    return Path;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
