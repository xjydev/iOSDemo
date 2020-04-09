//
//  JYHookObject.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "JYHookObject.h"
#import <objc/runtime.h>
@implementation JYHookObject
+ (void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector {
    Method fromMethod = class_getInstanceMethod(classObject, fromSelector);
    Method toMethod = class_getInstanceMethod(classObject, toSelector);
    BOOL didAddMethod = class_addMethod(classObject, fromSelector, method_getImplementation(toMethod), method_getTypeEncoding(toMethod));
    if (didAddMethod) {
        class_replaceMethod(classObject, toSelector, method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod));
    }
    else {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
}
@end
