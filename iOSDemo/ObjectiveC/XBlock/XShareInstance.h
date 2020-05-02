//
//  XShareInstance.h
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/11.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+cate.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^Block)(NSString *str);
@interface XShareInstance : NSObject
@property (nonatomic, copy)NSString *kvoStr;
+ (instancetype)share;
@property (nonatomic, strong)Block block;
- (void)instanceDealloc;
- (void)instanceBlock:(void(^)(NSString *str))block;
- (void)instanceWithStr:(NSString *)str Block:(Block)block;
@end


@interface XBlockObj : NSObject
@property (nonatomic, copy)void (^block)(NSString *b);
- (void)blockMethod;
@end
NS_ASSUME_NONNULL_END
