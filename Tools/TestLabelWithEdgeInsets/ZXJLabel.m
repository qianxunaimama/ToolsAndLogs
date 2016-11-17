//
//  ZXJLabel.m
//  TestLabelWithEdge
//
//  Created by 张信娟 on 16/11/17.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ZXJLabel.h"

@implementation ZXJLabel{

    UIEdgeInsets _insets;
}

-(instancetype)initWithInsets:(UIEdgeInsets)insets
{
    if (self = [super init]) {
        _insets = insets;
    }
    return self;
}

#pragma mark - 主要是重写该方法
-(void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _insets)];
}
@end
