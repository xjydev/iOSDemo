//
//  UIViewController+Hook.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "UIViewController+Hook.h"
#import "JYHookObject.h"

@implementation UIViewController (Hook)
+ (void)load {
    [self hookViewController];
}
+ (void)hookViewController {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [JYHookObject hookClass:self fromSelector:@selector(viewWillAppear:) toSelector:@selector(hook_viewWillAppear:)];
        [JYHookObject hookClass:self fromSelector:@selector(viewWillDisappear:) toSelector:@selector(viewWillDisappear:)];
    });
    
}
- (void)hook_viewWillAppear:(BOOL)animated {
    NSLog(@"hook == %s -- %@",__func__,self.class);
    [self hook_viewWillAppear:animated];
}
- (void)hook_viewWillDisappear:(BOOL)animated {
    NSLog(@"hook == %s -- %@",__func__,self.class);
    [self hook_viewWillDisappear:animated];
}
@end
