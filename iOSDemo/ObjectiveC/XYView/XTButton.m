//
//  XTButton.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/19.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XTButton.h"

@implementation XTButton
+ (instancetype)creatButtonFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = color;
    return  button;
}
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    CGRect bounds = self.bounds;
//     bounds = CGRectInset(bounds, -10, -10);
//       // CGRectContainsPoint  判断点是否在矩形内
//        return CGRectContainsPoint(bounds, point);
//    
//}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *supV = [super hitTest:point withEvent:event];
//    return supV;
//}
- (void)drawRect:(CGRect)rect {
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//     NSLog(@"button touch began");
//}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%s",__func__);
}
@end
