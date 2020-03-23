//
//  XTButton.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/19.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XTButton.h"

@implementation XTButton


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect bounds = self.bounds;
     bounds = CGRectInset(bounds, -30, -30);
       // CGRectContainsPoint  判断点是否在矩形内
        return CGRectContainsPoint(bounds, point);
    
}
- (void)drawRect:(CGRect)rect {
    
}


@end
