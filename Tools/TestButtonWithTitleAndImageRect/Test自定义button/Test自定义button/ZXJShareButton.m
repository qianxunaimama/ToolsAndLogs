//
//  ShareButton.m
//  Test自定义button
//
//  Created by 张信娟 on 16/9/2.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ZXJShareButton.h"
#import "ZXJShareModel.h"

#define KSImageScale 0.5


@implementation ZXJShareButton{
    
    ShareBtnClickedBack _callBack;
}

-(id)initWithFrame:(CGRect)frame andTag:(NSInteger )tag withBlock:(ShareBtnClickedBack)shareBtnClickedBack
{
    if (self = [super initWithFrame:frame]) {
        // 1、顶部图片
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setImage:[UIImage imageNamed:@"UMS_wechat_session_icon"] forState:UIControlStateNormal];
        
        // 2、设置文字
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:@"按钮" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        //3.设置索引
        self.tag = tag;
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //4.回调
        _callBack = [shareBtnClickedBack copy];
    }
    return self;
}

-(void)btnClick:(UIButton *)btn
{
    if (_callBack) {
        _callBack(btn.tag);
    }
}

#pragma mark - 更新button图片和title
-(void)updateViewWithShareModel:(ZXJShareModel *)shareModel
{
    [self setImage:[UIImage imageNamed:shareModel.shareImageName] forState:UIControlStateNormal];
    [self setTitle:shareModel.shareTitle forState:UIControlStateNormal];
    [self.titleLabel setTextColor:shareModel.shareTextColor];
    //[self.titleLabel setFont:[UIFont systemFontOfSize:11]];
}

#pragma mark - 设置按钮内部图片和文字的frame

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * KSImageScale;
    
    return CGRectMake(0, 0, imageWidth, imageHeight);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = contentRect.size.height * KSImageScale;
    CGFloat Y = contentRect.size.height  - titleHeight;
    
    return CGRectMake(0, Y, titleWidth, titleHeight);
}

@end
