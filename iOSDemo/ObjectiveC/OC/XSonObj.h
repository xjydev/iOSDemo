//
//  XSonObj.h
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFatherObj.h"
NS_ASSUME_NONNULL_BEGIN

@interface XSonObj : XFatherObj
@property (nonatomic, copy)NSString *xiaoDD;
@property (nonatomic, strong)NSNumber *number;//重新父类属性，不会自动生成存取方法。使用@dynamic可以消除警告。
@property (nonatomic, strong) NSNumber *ddstr;

- (void)learn;
- (void)getClass ;
@end

NS_ASSUME_NONNULL_END
