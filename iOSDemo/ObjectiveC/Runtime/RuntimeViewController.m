//
//  RuntimeViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/4/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"int   =   %s",@encode(int));
    NSLog(@"short   =   %s",@encode(short));
    NSLog(@"long   =   %s",@encode(long));
    NSLog(@"long long   =   %s",@encode(long long));
    NSLog(@"unsigned int   =   %s",@encode(unsigned int));
    NSLog(@"unsigned short   =   %s",@encode(unsigned short));
    NSLog(@"unsigned long   =   %s",@encode(unsigned long));
    NSLog(@"unsigned long long   =   %s",@encode(unsigned long long));
    NSLog(@"float   =   %s",@encode(float));
    NSLog(@"double   =   %s",@encode(double));
    NSLog(@"void   =   %s",@encode(void));
    NSLog(@"NSObject   =   %s",@encode(NSObject));
    NSLog(@"NSInteger   =   %s",@encode(NSInteger));
    NSLog(@"NSUInteger   =   %s",@encode(NSUInteger));
    NSLog(@"CGFloat   =   %s",@encode(CGFloat));
    NSLog(@"BOOL   =   %s",@encode(BOOL));
    
    NSLog(@"NSNumber   =   %s",@encode(NSNumber));
    NSLog(@"NSString   =   %s",@encode(NSString));
    
    NSMethodSignature* methodSig = [self methodSignatureForSelector:@selector(setNumber:)];
    const char* retType = [methodSig methodReturnType];
    const char *firstArgumentType = [methodSig getArgumentTypeAtIndex:2];
    NSLog(@"sig == %@",methodSig);
    NSLog(@"= %s = %s",retType,firstArgumentType);
    NSDictionary *d = @{@"name":@(2),@"roomid":@"12"};
    NSNull *u = [NSNull null];
    NSString *a = @"a";
    NSString *str = [[a mutableCopy]copy];
    NSLog(@"aaaa == %p %p %@", a, str, object_getClass(str));
    NSNumber *nu = d[@"roomid"];
    NSLog(@"nu == %@",object_getClass(nu));
    NSLog(@"p == %@ == %@",[self getIvarTypeWithInstance:self propertyName:@"num"],[self getIvarTypeWithInstance:self propertyName:@"str"]);
//    unsigned int  outCount = 0;
//    Ivar * varList = class_copyIvarList([self class], &outCount);
//    for (NSInteger i = 0; i<outCount; i++) {
//        Ivar ivar = varList[i];
//        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        NSString * ivartype = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
//
//
//        NSLog(@"name == %@ == %s    %s",name,ivar_getTypeEncoding(ivar),@encode(NSNumber));
//        if ([name isEqualToString:@"_num"]) {
//            if ([ivartype isEqualToString:@"@\"NSNumber\""]) {
//                NSLog(@"number encode ==== %@",name);
//            }
//        }
//
//    }
}
- (NSString *)getIvarTypeWithInstance:(id)instanc propertyName:(NSString *)name {
    NSString *pname = [NSString stringWithFormat:@"_%@",name];
    unsigned int  outCount = 0;
    Ivar * varList = class_copyIvarList([self class], &outCount);
    for (NSInteger i = 0; i<outCount; i++) {
        Ivar ivar = varList[i];
        NSString *iname = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([iname isEqualToString:pname]) {
            NSString * itype = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            NSString * ivarType = [itype stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
            NSLog(@"type == %@  %@",itype,ivarType);
            return ivarType;
        }
    }
    return nil;
}
- (void)setNumber:(NSNumber *)num {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
