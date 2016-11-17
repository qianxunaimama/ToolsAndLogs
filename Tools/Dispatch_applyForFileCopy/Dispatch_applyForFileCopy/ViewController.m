//
//  ViewController.m
//  Dispatch_applyForFileCopy
//
//  Created by 张信娟 on 16/11/17.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet  *)touches withEvent:(UIEvent *)event
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSString *from = @"/Users/zhangxinjuan/Desktop/from";
    NSString *to = @"/Users/zhangxinjuan/Desktop/to";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *subpaths = [fileManager  subpathsAtPath:from];
    
    dispatch_apply(subpaths.count, queue, ^(size_t index) {
        
        NSString *subpath = subpaths[index];
        NSString *fromFullPath = [from stringByAppendingPathComponent:subpath];
        NSString *toFullPath = [to stringByAppendingPathComponent:subpath];
        
        //剪切
        [fileManager moveItemAtPath:fromFullPath toPath:toFullPath error:nil];
        
        //GCD迭代会开启子线程,但是也会在主线程中执行
        NSLog(@"-------%@---%@",subpath,[NSThread currentThread]);
    });
    

}

@end
