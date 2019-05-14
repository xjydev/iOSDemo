//
//  RuntimeViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/4/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "RuntimeViewController.h"

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
