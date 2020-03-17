//
//  XThreadViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/14.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XThreadViewController.h"
#import "XThread2ViewController.h"
#import "XSonObj.h"
@interface XThreadViewController ()
@property (nonatomic, strong)XThread2ViewController *thread2;
@property (nonatomic, strong)XSonObj *arr;
@property (nonatomic, strong)NSOperationQueue *queue;
@end

@implementation XThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"线程";
    //监听
    self.arr = [[XSonObj alloc]init];
    [self.arr addObserver:self forKeyPath:@"xiaoDD" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //多线程
    self.queue = [[NSOperationQueue alloc]init];
    self.queue.maxConcurrentOperationCount = 2;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor redColor];
    button1.frame = CGRectMake(10, 120, 70, 70);
    [button1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor blueColor];
    button2.frame = CGRectMake(110,120, 70, 70);
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}
- (void)buttonAction1 {
    NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
        NSInteger i=0;
        while (i++<8) {
            sleep(1);
            NSLog(@"11--%@ ",@(i));
            
        }
        NSLog(@"opention 1111 ==%@",[NSThread currentThread]);
    }];
    [bo addExecutionBlock:^{
        NSLog(@"opention 1122 ==%@",[NSThread currentThread]);
    }];
    [self.queue addOperation:bo];
    
    NSInvocationOperation *io = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(whiledemo) object:nil];
    [self.queue addOperation:io];
    
    NSInvocationOperation *io2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(whiledemo2) object:nil];
    [self.queue addOperation:io2];
    
}
- (void)whiledemo2 {
    NSInteger i = 0;
    while (i++<10) {
        sleep(1);
        NSLog(@"22==%@",@(i));
        if (i == 5) {
            NSThread *currThread = [NSThread currentThread];
            [currThread cancel];
        }
    }
    NSLog(@"opention 2222 ==%@",[NSThread currentThread]);
}
- (void)whiledemo {
    if (1) {
        NSInteger i=0;
        while (i<8) {
            sleep(1);
            NSLog(@"55 ==%@",@(i));
            i++;
        }
        NSLog(@"Opertion 55 === %@",[NSThread currentThread]);
    }
    
}
- (void)buttonAction2 {
    for (NSOperation *op in self.queue.operations) {
        NSLog(@"status == %d == %d",op.cancelled,op.finished);
    }
    NSLog(@"==cancel==");
    [self.queue cancelAllOperations];
    for (NSOperation *op in self.queue.operations) {
        NSLog(@"status2 == %d == %d",op.cancelled,op.finished);
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"change %@",change);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (NSOperation *op in self.queue.operations) {
        NSLog(@"status3 == %d == %d",op.cancelled,op.finished);
    }
    XThread2ViewController *th =[[XThread2ViewController alloc]init];
    th.arr = self.arr;
    [self.navigationController pushViewController:th animated:YES];
    
}
- (void)dealloc {
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
