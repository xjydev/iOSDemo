//
//  XTools.h
//  iOSDemo
//
//  Created by XiaoDev on 04/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XTOOLS [XTools shareXTools]

#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;
//屏幕的宽度,支持旋转屏幕
#define kScreen_Width  (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) \
? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

//userDefaults
#define kUSerD [NSUserDefaults standardUserDefaults]
//观察者
#define kNOtificationC [NSNotificationCenter defaultCenter]
//文件管理器
#define kFileM    [NSFileManager defaultManager]
//document路径
#define KDocumentP [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kCachesP [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kTmpP NSTemporaryDirectory()
//单例Application
#define APPSHAREAPP [UIApplication sharedApplication]
//是ipad
#define IsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kDevice_Is_iPhoneX  CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)
//系统版本号
#define IOSSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
//当前应用版本 版本比较用
#define APP_CURRENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//屏幕的高度,支持旋转屏幕
#define kScreen_Height                                                                                  \
(UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) \
? [UIScreen mainScreen].bounds.size.width                                               \
: [UIScreen mainScreen].bounds.size.height)
@interface XTools : NSObject
+ (instancetype _Nullable )shareXTools;
+ (id _Nonnull )alloc NS_UNAVAILABLE;
+ (instancetype _Nullable )new NS_UNAVAILABLE;
@end
