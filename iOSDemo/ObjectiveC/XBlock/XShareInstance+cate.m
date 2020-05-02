//
//  XShareInstance+cate.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/26.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XShareInstance+cate.h"
#import <objc/runtime.h>
static char *objectNumChar = "oonumchar";

@implementation XShareInstance (cate)
- (void)setObjectNum:(NSNumber *)objectNum {
    objc_setAssociatedObject(self, &objectNumChar, objectNum, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber*)objectNum {
    return @2;
}
@end
