//
//  XSonObj+cate.h
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//


#import "XSonObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSonObj (cate)
@property (nonatomic, copy)NSString *proNN;//只在属性列表里面有，set get方法和成员变量没有自动生成。
+ (void)test;
- (void)test;
@end

NS_ASSUME_NONNULL_END
