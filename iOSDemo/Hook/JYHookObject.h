//
//  JYHookObject.h
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYHookObject : NSObject
+ (void)hookClass:(Class)classObject fromSelector:(SEL)fSelector toSelector:(SEL)tSelector;
@end

NS_ASSUME_NONNULL_END
