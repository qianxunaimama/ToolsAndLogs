//
//  ZXJShareView.m
//  Test自定义button
//
//  Created by 张信娟 on 16/9/2.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ZXJShareView.h"
#import "ZXJShareButton.h"

@interface ZXJShareView()
//背景view
@property (strong, nonatomic)  UIImageView *maskView;

//整个下面的view
@property (strong, nonatomic)  UIView *bottomView;

//取消
@property (strong, nonatomic)  UIButton *cancleButton;

//间隔线
@property (strong, nonatomic)  UIView *lineView;



@end

@implementation ZXJShareView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        [self getDataSource];
        
        [self initSubView];
    }
    return self;
}

-(void)initSubView
{
    [self addSubview:self.maskView];
    [self addSubview:self.bottomView];
    
    [self.bottomView addSubview:self.lineView];
    [self.bottomView addSubview:self.cancleButton];
    
    [self.maskView setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.maskView.backgroundColor = [UIColor blueColor];
    self.maskView.alpha = 0.5;
    
    [self.bottomView setFrame:CGRectMake(0, self.bounds.size.height - 200, self.bounds.size.width, 200)];
    
    self.bottomView.backgroundColor = [UIColor redColor];

    
    [self.cancleButton setFrame:CGRectMake(0, self.bottomView.frame.size.height - 80, self.bottomView.frame.size.width, 80)];
    
    [self initItemView];
    
}

#pragma mark - 创建九宫格
-(void)initItemView
{
    CGFloat itemWidth =  (self.bottomView.frame.size.width - 20)/4;
    CGFloat buttonWidth =  itemWidth - 20;
    
    NSLog(@"sharemodel count is %ld",self.shareModelArray.count);
    
    for (int i  = 0;  i < self.shareModelArray.count; i++) {
    
//        ZXJShareView *model = self.shareModelArray[i];
        
        ZXJShareButton *shareButton = [[ZXJShareButton alloc]initWithFrame:CGRectMake(20+itemWidth*i, 10, buttonWidth, 90) andTag:i withBlock:^(NSInteger tag) {
            
            
            [self itemClickedAtIndex:tag];
            
        }];
        
        shareButton.backgroundColor = [UIColor blackColor];
//        [shareButton updateViewWithShareModel:model];
        
        [self.bottomView addSubview:shareButton];
        
    }
}

-(void)cancleButtonClick
{
    
}

-(void)itemClickedAtIndex:(NSInteger)index
{
    NSLog(@"选中的index  is %ld",index);
}


#pragma mark - 懒加载

-(UIImageView *)maskView
{
    if (!_maskView) {
        _maskView = [UIImageView new];
        _maskView.backgroundColor = [UIColor lightGrayColor];
        _maskView.alpha = 0;
        [_maskView setUserInteractionEnabled:YES];
        [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleButtonClick)]];
    }
    return _maskView;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        
        _bottomView = [UIView new];
        _bottomView.backgroundColor  = [UIColor whiteColor];
    }
    return _bottomView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

-(UIButton *)cancleButton
{
    if (!_cancleButton) {
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleButton.backgroundColor = [UIColor whiteColor];
        [_cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleButton;
}

-(NSMutableArray *)shareModelArray
{
    if (!_shareModelArray) {
        _shareModelArray = [[NSMutableArray alloc]init];
        NSLog(@"aaa");
    }
    return _shareModelArray;
}
@end
