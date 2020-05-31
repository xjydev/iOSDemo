//
//  XRuntimeObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XRuntimeObj.h"
#import "XForwardObj.h"
#import <objc/runtime.h>

@interface XRuntimeObj ()
@property (nonatomic, strong) XForwardObj *forwardObj;
@end

@implementation XRuntimeObj
- (void)forwardFuncation {
   NSLog(@" == %s",__func__);
}
- (XForwardObj *)forwardObj {
    if (!_forwardObj) {
        _forwardObj = [[XForwardObj alloc]init];
    }
    return _forwardObj;
}
+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@" == %s",__func__);
    if (sel == NSSelectorFromString(@"undefindClassFunction")) {
        Method toMethod = class_getInstanceMethod(self, @selector(xr_undefindClassFunction));
        Class metaclass = objc_getMetaClass(class_getName(self));
     BOOL add = class_addMethod(metaclass, sel, method_getImplementation(toMethod), method_getTypeEncoding(toMethod));
        return add;
    }
    return NO;
}
- (void)xr_undefindClassFunction {
   NSLog(@" == %s",__func__);
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@" == %s",__func__);
    return NO;
}
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@" == %s",__func__);
    return nil;
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@" == %s",__func__);
    if ([self.forwardObj respondsToSelector:aSelector]) {
        return [self.forwardObj methodSignatureForSelector:aSelector];
    }
    return nil;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@" == %s",__func__);
    [anInvocation invokeWithTarget:self.forwardObj];
    
}
@end
