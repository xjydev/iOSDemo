//
//  XModel.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/11/15.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XModel.h"

@implementation XModel
- (id)copyWithZone:(NSZone *)zone {
  XModel *model = [[XModel alloc]init];
    model.aindex = self.aindex;
    return model;
}
- (instancetype)initWithNum:(NSInteger)num {
    self = [super init];
    return self;
}
@end

@implementation XModel2

@end
