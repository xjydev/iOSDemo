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
    NSLog(@"onceToken 1+++ %@",@(onceToken));
    dispatch_once(&onceToken, ^{
        NSLog(@"onceToken 2++ %@",@(onceToken));
        instance = [[XShareInstance alloc]init];
    });
    NSLog(@"onceToken 3++ %@",@(onceToken));
    return instance;
}
- (void)instanceDealloc {
    instance = nil;
    onceToken = 0;
    NSLog(@"shere == %@",instance);
}
- (void)instanceBlock:(void (^)(NSString * _Nonnull))block {
    self.block = block;
    block(@"0000");
}
- (void)instanceWithStr:(NSString *)str Block:(Block)block {
    self.block = block;
    
}
@end

@implementation XBlockObj

- (void)blockMethod {
    if (self.block) {
        self.block(@"1");
    }
}

@end
