//
//  ShareButton.h
//  Test自定义button
//
//  Created by 张信娟 on 16/9/2.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ShareBtnClickedBack)(NSInteger);

@interface ZXJShareButton : UIButton

-(id)initWithFrame:(CGRect)frame andTag:(NSInteger )tag withBlock:(ShareBtnClickedBack)shareBtnClickedBack;

@end
