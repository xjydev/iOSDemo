//
//  XModel.h
//  iOSDemo
//
//  Created by XiaoDev on 2019/11/15.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
NS_ASSUME_NONNULL_BEGIN
@class XModel3;
@interface XModel : JSONModel<NSCopying>
@property (nonatomic, assign)int aindex;
- (instancetype)initWithNum:(NSInteger)num;
@end

@interface XModel2 : NSObject
@property (nonatomic, assign)int aindex;
@property (nonatomic, strong)XModel3 *model;

@end

@interface XModel3 : NSObject
@property (nonatomic, strong)XModel2 *model;
@end
NS_ASSUME_NONNULL_END
