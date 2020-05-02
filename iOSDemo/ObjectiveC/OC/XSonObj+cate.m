//
//  XSonObj+cate.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XSonObj+cate.h"

@implementation XSonObj (cate)
+ (void)load {
    NSLog(@"%s",__func__);
}
+ (void)initialize {
    NSLog(@"%s",__func__);
}
- (void)learn {
    NSLog(@"%s",__func__);
}
+ (void)test {
  NSLog(@"%s",__func__);
}
//- (void)dealloc {
//    NSLog(@"%s",__func__);
//}
@end
