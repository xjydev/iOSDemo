//
//  XTools.m
//  iOSDemo
//
//  Created by XiaoDev on 04/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XTools.h"

@implementation XTools
+ (instancetype)shareXTools {
    static XTools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[XTools alloc] init];
    });
    return tools;
}
@end
