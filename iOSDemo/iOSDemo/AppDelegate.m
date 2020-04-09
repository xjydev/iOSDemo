//
//  AppDelegate.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//
#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#endif

#import "AppDelegate.h"
#import "iOSDemo-Swift.h"
//#import <BMKLocationkit/BMKLocationComponent.h>
//#import <BaiduMapAPI_Base/BMKMapManager.h>
@interface AppDelegate ()
//<BMKLocationAuthDelegate>
//@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#ifdef DEBUG
    //默认
    [[DoraemonManager shareInstance] install];
    // 或者使用传入位置,解决遮挡关键区域,减少频繁移动
    //[[DoraemonManager shareInstance] installWithStartingPosition:CGPointMake(66, 66)];
#endif
    // 初始化定位SDK
//    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"Please enter your key" authDelegate:self];
//    //要使用百度地图，请先启动BMKMapManager
//    _mapManager = [[BMKMapManager alloc] init];
//
//    /**
//     百度地图SDK所有API均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
//     默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
//     如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
//     */
//    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
//        NSLog(@"经纬度类型设置成功");
//    } else {
//        NSLog(@"经纬度类型设置失败");
//    }
    
    //启动引擎并设置AK并设置delegate
//    BOOL result = [_mapManager start:@"Please enter your key" generalDelegate:self];
//    if (!result) {
//        NSLog(@"启动引擎失败");
//    }
    
//    NSNumber *num = @(18618393874);
//    NSString *numst = num;
//    NSLog(@"===%@",numst);
//    [self setArray:1,2,3,0];
//
//    SwiftTableController *VC = [[SwiftTableController alloc]init];
    int a = 10;
    int b = 5;
    a = a^b;
    b = a^b;
    a = a^b;
    NSLog(@"%d  %d",a,b);
    return YES;
}
- (void)setArray:(NSInteger)a,... {
    va_list args;
    va_start(args, a);
    for (NSInteger b = a; b != 0; b = va_arg(args, NSInteger)) {
        NSLog(@"b = %@",@(b));
    }
    va_end(args);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}

@end
