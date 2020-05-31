//
//  XForwardObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XForwardObj.h"

@implementation XForwardObj
- (void)undefindFunction {
    NSLog(@" == %s",__func__);
}
+ (void)undefindClassFunction {
    NSLog(@" == %s",__func__);
}
- (void)forwardFuncation {
   NSLog(@" == %s",__func__);
}
@end
