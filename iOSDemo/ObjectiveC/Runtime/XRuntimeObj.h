//
//  XRuntimeObj.h
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XRuntimeObj : NSObject
- (void)undefindFunction;
- (void)forwardFuncation;
+ (void)undefindClassFunction;

@end

NS_ASSUME_NONNULL_END
