//
//  XYView.m
//  iOSDemo
//
//  Created by XiaoDev on 06/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XYView.h"

@implementation XYView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    [self setNeedsLayout];
    return self;
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
