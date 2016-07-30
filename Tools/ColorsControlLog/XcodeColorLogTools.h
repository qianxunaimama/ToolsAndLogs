//
//  XcodeColorLogTools.h
//  EASYMONIT-Family
//
//  Created by 疯兔 on 15/7/10.
//  Copyright (c) 2015年 ZW. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 以下无关项目

#define ZLOG_FUNCTION_BLUSH  ZLogLavenderBlush(@"%s",__FUNCTION__)


#define KVIEWCOLOR @"#00aceb"
#define COLORFONT1816 @"333333"
#define COLORFONT16 @"666666"
#define COLORFONT14 @"999999"


#define SECTIONCOLOR @"#abe6fd"

#define XCODECOLORS 10
#if XCODECOLORS
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"
#define ZLog(fmt,...) NSLog((@"\n %s - [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__);
#define ZLogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define ZLogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,238,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define ZLogLightSlateBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg132,112,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define ZLogLightYellow(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define ZLogLavenderBlush(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,100,245;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#elif DEBUG
#define ZLog(fmt,...) NSLog((@"\n %s - [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__);
#define ZLogRed(frmt, ...) NSLog((frmt), ##__VA_ARGS__)
#define ZLogGreen(frmt, ...) NSLog((frmt), ##__VA_ARGS__)
#define ZLogLightSlateBlue(frmt, ...) NSLog((frmt), ##__VA_ARGS__)
#define ZLogLightYellow(frmt, ...) NSLog((frmt), ##__VA_ARGS__)
#define ZLogLavenderBlush(frmt, ...) NSLog((frmt), ##__VA_ARGS__)
#else
#define ZLogRed(frmt, ...) 
#define ZLogGreen(frmt, ...)
#define ZLogLightSlateBlue(frmt, ...)
#define ZLogLightYellow(frmt, ...)
#define ZLogLavenderBlush(frmt, ...)
#endif



/**
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@weakify_self`实现弱引用转换，`@strongify_self`实现强引用转换
 *
 * 示例：
 * @weakify_self
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef    weakify_self
#if __has_feature(objc_arc)
#define weakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define weakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif
#ifndef    strongify_self
#if __has_feature(objc_arc)
#define strongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define strongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif
/**
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@weakify(object)`实现弱引用转换，`@strongify(object)`实现强引用转换
 *
 * 示例：
 * @weakify(object)
 * [obj block:^{
 * @strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef    weakify
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#endif
#ifndef    strongify
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) strong##_##object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) strong##_##object = block##_##object;
#endif
#endif
