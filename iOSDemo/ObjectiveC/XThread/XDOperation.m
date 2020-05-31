//
//  XDOperation.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/1.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XDOperation.h"

@interface XDOperation () {
    BOOL _isFinished;
    BOOL _isExecuting;
}

@end
@implementation XDOperation
- (void)start {
    NSLog(@"start == %@",[NSThread currentThread]);
    if ([self isCancelled]){
        // 我们取消了该 operation，那么就要告诉KVO，该operation已经执行完成（isFinished）
        // 这样，调用的队列（或者线程）会继续执行。
        [self willChangeValueForKey:@"isFinished"];
        _isFinished = NO;
        [self didChangeValueForKey:@"isFinished"];
    } else {
        // 没有取消，那就要告诉KVO，该队列开始执行了（isExecuting）！那么，就会调用main方法，进行同步执行。
        [self willChangeValueForKey:@"isExecuting"];
        _isExecuting = YES;
        [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
        [self didChangeValueForKey:@"isExecuting"];
    }
}
- (void)main {
    @autoreleasepool {
        NSLog(@"main == %@",[NSThread currentThread]);
        if (self.isCancelled) {
            return;
        }
        static int a = 0;
        while (a < 5) {
          NSLog(@"main %d",a);
            sleep(1);
            a ++;
        }
        
    }
}
- (BOOL)isExecuting {
return _isExecuting;
}

- (BOOL)isFinished {
return _isFinished;
}
@end
