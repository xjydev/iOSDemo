//
//  XSonObj.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XSonObj.h"
#import "XDaughterObj.h"
@implementation XSonObj
@dynamic ddstr; 
+(void)load {
    NSLog(@"%s",__func__);
//    [XDaughterObj name];

}
+ (void)initialize {
    NSLog(@"%s",__func__);
}
- (instancetype)init {
    self = [super init];
    NSLog(@"%s",__func__);
    return self;
}
- (void)learn {
    NSLog(@"%s",__func__);
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}
- (void)getClass {
    
    NSLog(@"class == %@  %@ -- %@",self.class,super.class,self);
    [super slog];
}
- (void)slog {
    NSLog(@"slog111 -- %@",self);
}
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return  self.class;
}
@end
