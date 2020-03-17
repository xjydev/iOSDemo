//
//  XWifeObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XWifeObj.h"

@implementation XWifeObj
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
+ (void)name {
    NSLog(@"%s",__func__);
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}
@end
