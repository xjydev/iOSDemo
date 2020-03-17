//
//  XDaughterObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XDaughterObj.h"
#import "XSonObj.h"
@implementation XDaughterObj
+(void)load {
    NSLog(@"%s",__func__);
//    XSonObj *d = [[XSonObj alloc]init];
//    [d learn];
}
+ (void)initialize {
    NSLog(@"%s",__func__);
}
- (instancetype)init {
    self = [super init];
    NSLog(@"%s",__func__);
    return self;
}
- (void)learn {
    NSLog(@"%s",__func__);
}
+ (void)name {
   NSLog(@"%s",__func__);
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}
@end
