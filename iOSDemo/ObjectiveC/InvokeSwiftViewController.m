//
//  InvokeSwiftViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/9.
//  Copyright © 2020 Xiaodev. All rights reserved.
//调用Swift
//添加头文件iOSDemo-Swift.h

#import "InvokeSwiftViewController.h"
#import "iOSDemo-Swift.h"
@interface InvokeSwiftViewController ()

@end

@implementation InvokeSwiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    OCObject *obj = [[OCObject alloc]init];
    NSLog(@"%@",obj.name);
    [obj objectFuncWithA:1 b:2];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    InvokeOCViewController *ocVC = [[InvokeOCViewController alloc]init];
    NSLog(@"%ld",ocVC.publicVar);
    [ocVC publicFuncWithA:1];
    [ocVC ocFuncWithA:1 b:2];
    [self.navigationController pushViewController:ocVC animated:YES];
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

