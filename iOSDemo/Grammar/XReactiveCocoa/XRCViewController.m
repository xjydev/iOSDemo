//
//  XRCViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XRCViewController.h"
#import "XTButton.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface XRCViewController ()
@property (nonatomic, strong)RACSignal *signal;
@property (nonatomic, strong)RACSubject *subject;
@end

@implementation XRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    XTButton *button = [XTButton creatButtonFrame:CGRectMake(0, 120, 100, 100) title:@"热信号" color:[UIColor redColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    XTButton *button1 = [XTButton creatButtonFrame:CGRectMake(120, 120, 100, 100) title:@"发送热信号" color:[UIColor redColor]];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    
    self.signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"create signal");
        [subscriber sendNext:@1];
        [subscriber sendNext:@2];
        [subscriber sendNext:@3];
        sleep(5);
        [subscriber sendNext:@4];
        return  nil;
    }];
    self.subject = [RACSubject subject];
    [self.subject sendNext:@21];
    
}
- (void)buttonAction1 {
    [self.subject sendNext:@22];
}
- (void)buttonAction {
    RACSubject *sub = [RACSubject subject];
    [sub subscribeNext:^(id x) {
        NSLog(@"sub1 %@",x);
    }];
    
    [[self.subject takeUntil:sub]subscribeNext:^(id x) {
         NSLog(@"sub2 %@",x);
    }];
    [self.subject subscribeNext:^(id x) {
        NSLog(@"sub3 %@",x);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.signal subscribeNext:^(id x) {
        NSLog(@"signal1 == %@",x);
    }];
    [self.signal subscribeNext:^(id x) {
        NSLog(@"signal2 == %@",x);
    }];
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

@interface ListNode : NSObject
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) ListNode *left;
@property (nonatomic, strong) ListNode *right;
@end
@implementation ListNode


@end
@interface codeImplementation : NSObject
@property (nonatomic, strong)NSMutableArray *nodeMarray;
@property (nonatomic, copy)NSArray *currentArray;
@end
@implementation codeImplementation

- (void)printNOde:(ListNode *)head {
    if (head == nil) {
        return;
    }
    NSLog(@"%@",head.value);
       [self.nodeMarray addObject:head.left];
       [self.nodeMarray addObject:head.right];
    while (self.nodeMarray.count == 0) {
        ListNode *first = self.nodeMarray.firstObject;
        NSLog(@"%@",first.value);
        [self.nodeMarray removeObjectAtIndex:0];
        if (first.left) {
          [self.nodeMarray addObject:first.left];
        }
        if (first.right) {
          [self.nodeMarray addObject:first.right];
        }
    }
    
}

@end
