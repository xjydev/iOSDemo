//
//  RuntimeViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/4/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
#import "XRuntimeObj.h";
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
    
    XRuntimeObj *runoj = [[XRuntimeObj alloc]init];
    [XRuntimeObj undefindClassFunction];
    [runoj undefindFunction];
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

//NSInvocation对象用于在对象之间和应用程序之间存储和转发消息，主要是通过NSTimer对象和分布式对象系统实现的。NSInvocation对象包含Objective-C消息的所有元素:目标、选择器、参数和返回值。每个元素都可以直接设置，并且在分派NSInvocation对象时自动设置返回值。
//一个NSInvocation对象可以被多次分派到不同的目标;它的参数可以在调度之间进行修改，以获得不同的结果;甚至它的选择器也可以更改为具有相同方法签名(参数和返回类型)的其他选择器。这种灵活性使得nsinvoke对于重复具有许多参数和变体的消息非常有用;不是为每个消息重新键入略有不同的表达式，而是在每次将NSInvocation对象发送到新目标之前根据需要修改它。
//NSInvocation不支持使用变量数量的参数或联合参数调用方法。你应该使用invocationWithMethodSignature: class方法来创建NSInvocation对象;您不应该使用alloc和init来创建这些对象。
//默认情况下，该类不保留所包含调用的参数。如果这些对象可能在您创建NSInvocation实例和使用它之间消失，那么您应该显式地自己保留这些对象，或者调用retainArguments方法来让调用对象自己保留它们。
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
