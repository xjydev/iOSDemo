//
//  XFatherObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XFatherObj.h"

@implementation XFatherObj
+(void)load {
    NSLog(@"%s",__func__);
}
+ (void)initialize {
    NSLog(@"%s",__func__);
}
- (instancetype)init {
    self = [super init];
     NSLog(@"%s",__func__);
    return self;
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}
- (void)slog {
    NSLog(@"slog2 -- %@",self);
}
@end
