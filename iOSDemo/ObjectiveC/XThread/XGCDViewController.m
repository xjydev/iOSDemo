//
//  XGCDViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/3.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XGCDViewController.h"

@interface XGCDViewController ()
@property (nonatomic, strong)dispatch_queue_t queue;
@end

@implementation XGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //DISPATCH_QUEUE_CONCURRENT  并发调度对列
    //DISPATCH_QUEUE_SERIAL 先进先出FIFO串行队列。
    
    self.queue = dispatch_queue_create("xiao.cn.", DISPATCH_QUEUE_CONCURRENT);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"11");
    dispatch_async(self.queue, ^{
        NSThread *the =[NSThread currentThread];
         NSLog(@"22 == %@",the);
         dispatch_sync(self.queue, ^{
                NSLog(@"55");
               
           });
         NSLog(@"33");
    });
    NSLog(@"44");
}
- (void)onThreadFun {
     NSLog(@"44");
   
     NSLog(@"66");
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
