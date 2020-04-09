//
//  XRunloopViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XRunloopViewController.h"

@interface XRunloopViewController ()

@property (nonatomic, strong)NSPort *port;
@property (nonatomic, strong)NSThread *thread;
@property (nonatomic, strong)NSRunLoop *loop;
@property (nonatomic, copy)NSNumber *sta;
@end

@implementation XRunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"t0 == %@",[NSThread currentThread]);
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.port = [NSPort port];
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadAction) object:nil];
    [self.thread start];
    @autoreleasepool {
        self.sta = [NSNumber numberWithInt:2];
    }
    
}
- (void)threadAction {
    NSLog(@"t1 == %@",[NSThread currentThread]);
    self.loop = [NSRunLoop currentRunLoop];
    [self.loop addPort:self.port forMode:NSDefaultRunLoopMode];
    [self.loop run];
    NSScanner;
//    [self.loop runMode:@"yyy" beforeDate:[NSDate dateWithTimeIntervalSinceNow:20]];
//    [self.loop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:100000]];
}
- (void)btnAction {
    [self.loop removePort:self.port forMode:NSDefaultRunLoopMode];
//    [self.loop runUntilDate:[NSDate date]];
    if (self.loop != nil) {
        CFRunLoopStop([self.loop getCFRunLoop]);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"t == %@",self.thread);
    [self performSelector:@selector(run) onThread:self.thread withObject:nil  waitUntilDone:NO];
}
- (void)run {
     NSLog(@" == %@",self.thread);
     NSLog(@"%s",__func__);
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
