//
//  ViewController.m
//  Test自定义button
//
//  Created by 张信娟 on 16/9/2.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ViewController.h"

#import "ZXJShareButton.h"

#import "ZXJShareModel.h"

#import "ZXJShareView.h"

@interface ViewController ()

@property (strong, nonatomic)  NSMutableArray *shareModelArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getDataSource];
    
    ZXJShareView *shareView = [[ZXJShareView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    shareView.shareModelArray = [NSMutableArray arrayWithArray:[self.shareModelArray mutableCopy]];
    
    //[shareView setShareModelArray:self.shareModelArray];
    NSLog(@"模型数组的个数是：%ld",self.shareModelArray.count);
    [self.view addSubview:shareView];
    
}

-(void)getDataSource{
    
    BOOL is_installedWeibo = NO;    //[WeiboSDK isWeiboAppInstalled];
    BOOL is_installed_QQ = NO;      //[QQApiInterface isQQInstalled];
    BOOL is_installed_weixin = YES; //[WXApi isWXAppInstalled];
    
    if (is_installed_weixin) {
        ZXJShareModel *shareModelWXApp = [[ZXJShareModel alloc]init];
        
        shareModelWXApp.shareType = @"UMShareToWechatSession";
        shareModelWXApp.shareTitle = @"微信";
        shareModelWXApp.shareImageName = @"UMS_wechat_session_icon";
        shareModelWXApp.shareTextColor = [UIColor blackColor];
        
        [self.shareModelArray addObject:shareModelWXApp];
        
        
        ZXJShareModel *shareModelWXAppFriend = [[ZXJShareModel alloc]init];
        
        shareModelWXAppFriend.shareType = @"UMShareToWechatTimeline";
        shareModelWXAppFriend.shareTitle = @"微信朋友圈";
        shareModelWXAppFriend.shareImageName = @"UMS_wechat_timeline_icon";
        shareModelWXAppFriend.shareTextColor = [UIColor blackColor];
        
        [self.shareModelArray addObject:shareModelWXAppFriend];
    }
    
    if (is_installed_QQ) {
        
        ZXJShareModel *shareModelWXApp = [[ZXJShareModel alloc]init];
        
        shareModelWXApp.shareType = @"UMShareToQQ";
        shareModelWXApp.shareTitle = @"QQ好友";
        shareModelWXApp.shareImageName = @"account_icon_qq";
        shareModelWXApp.shareTextColor = [UIColor blackColor];
        
        [self.shareModelArray addObject:shareModelWXApp];
        
        
        ZXJShareModel *shareModelWXAppFriend = [[ZXJShareModel alloc]init];
        
        shareModelWXAppFriend.shareType = @"UMShareToQzone";
        shareModelWXAppFriend.shareTitle = @"QQ空间";
        shareModelWXAppFriend.shareImageName = @"account_icon_qzone";
        shareModelWXAppFriend.shareTextColor = [UIColor blackColor];
        
        [self.shareModelArray addObject:shareModelWXAppFriend];
        
        
    }
    
    if (is_installedWeibo) {
        
        ZXJShareModel *shareModel = [[ZXJShareModel alloc]init];
        
        shareModel.shareType = @"UMShareToSina";
        shareModel.shareTitle = @"新浪微博";
        shareModel.shareImageName = @"account_icon_weibo";
        shareModel.shareTextColor = [UIColor blackColor];
        
        [self.shareModelArray addObject:shareModel];
    }
    
    ZXJShareModel *shareModel = [[ZXJShareModel alloc]init];
    
    shareModel.shareType = @"UMShareToSms";
    shareModel.shareTitle = @"短信";
    shareModel.shareImageName = @"UMS_sms_icon";
    shareModel.shareTextColor = [UIColor blackColor];
    
    [self.shareModelArray addObject:shareModel];
    
}

-(NSMutableArray *)shareModelArray
{
    if (!_shareModelArray) {
        _shareModelArray = [[NSMutableArray alloc]init];
    }
    return _shareModelArray;
}
@end
