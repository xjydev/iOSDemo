//
//  UIApplication+Hook.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "UIApplication+Hook.h"
#import "JYHookObject.h"

@implementation UIApplication (Hook)
+ (void)hookApplication {
    [JYHookObject hookClass:self fromSelector:@selector(sendAction:to:from:forEvent:) toSelector:@selector(hook_sendAction:to:from:forEvent:)];
}
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [JYHookObject hookClass:self fromSelector:@selector(sendAction:to:from:forEvent:) toSelector:@selector(hook_sendAction:to:from:forEvent:)];
    });
}
- (BOOL)hook_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    if ([[[event allTouches]anyObject]phase] == UITouchPhaseEnded) {
      NSLog(@"hookapp %@ -- %@",NSStringFromSelector(action),NSStringFromClass([target class]));
    }
    
    return [self hook_sendAction:action to:target from:sender forEvent:event];
}
@end
