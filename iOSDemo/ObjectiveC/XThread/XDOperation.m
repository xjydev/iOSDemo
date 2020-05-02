//
//  XDOperation.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/1.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XDOperation.h"

@implementation XDOperation
- (void)start {
    NSLog(@"start");
}
- (void)main {
    @autoreleasepool {
        if (self.isCancelled) {
            return;
        }
        static int a = 0;
        while (a < 5) {
          NSLog(@"main %d",a);
            sleep(1);
        }
        
    }
}
@end
