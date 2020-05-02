//
//  NSObject+cate.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "NSObject+cate.h"
#import <objc/runtime.h>
@implementation NSObject (cate)
- (void)runObject {
    NSLog(@"%s",__func__);
}
+ (void)runStatus {
   NSLog(@"%s",__func__);
}

@end
