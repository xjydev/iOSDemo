//
//  XShareInstance.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/11.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XShareInstance.h"
static XShareInstance *instance = nil;
static dispatch_once_t onceToken;
@implementation XShareInstance
+ (instancetype)share {
    NSLog(@"1+++ %@",@(onceToken));
    dispatch_once(&onceToken, ^{
        NSLog(@"2++ %@",@(onceToken));
        instance = [[XShareInstance alloc]init];
    });
    NSLog(@"3++ %@",@(onceToken));
    return instance;
}
- (void)instanceDealloc {
    onceToken = 0;
}
- (void)instanceBlock:(void (^)(NSString * _Nonnull))block {
    self.block = block;
    block(@"0000");
}
- (void)instanceWithStr:(NSString *)str Block:(Block)block {
    self.block = block;
    
}
@end
