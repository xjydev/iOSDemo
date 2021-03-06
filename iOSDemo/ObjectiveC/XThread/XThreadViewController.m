//
//  XThreadViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/14.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XThreadViewController.h"
#import "XThread2ViewController.h"
#import "XGCDViewController.h"
#import "XSonObj.h"
#import "XTButton.h"
#import "XDOperation.h"
@interface XThreadViewController (){
    dispatch_semaphore_t _semaphoret;
}

@property (nonatomic, strong)XThread2ViewController *thread2;
@property (nonatomic, strong)XSonObj *arr;
@property (nonatomic, strong)NSOperationQueue *queue;
@property (nonatomic, strong)NSString *keykey;
@property (nonatomic, strong)NSLock *lock;
@end

@implementation XThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"1",@"1",@"2",];
    NSSet *set = [NSSet setWithArray:arr];
    NSLog(@"%@--%@",arr,set); 
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"线程";
    [self addObserver:self forKeyPath:@"keykey" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    NSLog(@"111");
    [self willChangeValueForKey:@"keykey"];
    NSLog(@"112");
    [self didChangeValueForKey:@"keykey"];
    NSLog(@"113");
    //监听
    self.arr = [[XSonObj alloc]init];
    [self.arr addObserver:self forKeyPath:@"xiaoDD" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //多线程
    self.queue = [[NSOperationQueue alloc]init];
    self.queue.maxConcurrentOperationCount = 1;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, 120, 70, 70);
    [button1 addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor yellowColor];
    button2.frame = CGRectMake(110,120, 70, 70);
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    XTButton *button3 = [XTButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor blueColor];
    button3.frame = CGRectMake(190,120, 70, 70);
    [button3 addTarget:self action:@selector(buttonAction3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
#pragma mark -- 圆角的实现：
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    UIImage *image2 = [UIImage imageNamed:@"22"];
    UIGraphicsBeginImageContextWithOptions(button2.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:button2.bounds cornerRadius:40]addClip];
    [image2 drawInRect:button2.bounds];
    UIImage *endImage = UIGraphicsGetImageFromCurrentImageContext();
    [button2 setImage:endImage forState:UIControlStateNormal];
    UIGraphicsEndImageContext(); 
    CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
    NSLog(@"time1 ==  %f",time1 - startTime);
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:button1.bounds byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(30, 30)];
    mask.path = path.CGPath;
    mask.frame = button1.bounds;
    button1.layer.mask = mask;

    CFAbsoluteTime time2 = CFAbsoluteTimeGetCurrent();
    NSLog(@"time2 == %f",time2 - time1);
    
    button3.layer.cornerRadius = 30;
    button3.layer.masksToBounds = YES;
    CFAbsoluteTime time3 = CFAbsoluteTimeGetCurrent();
       NSLog(@"time2 == %f",time3 - time2);
//    [self interview1];
    [self nsthread2];
    dispatch_queue_t  aSerialQueue = dispatch_queue_create("iosxiao.name",DISPATCH_QUEUE_SERIAL);
    dispatch_sync(aSerialQueue, ^(void) {
        //        NSLog(@"==========");
        //        [self funcA];
        NSLog(@"00000000000");
    });
    NSLog(@"333333333");
    [self exchangeThread];
    [self mainAsync];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.backgroundColor = [UIColor redColor];
    button5.frame = CGRectMake(10, 220, 70, 70);
    [button5 addTarget:self action:@selector(buttonAction5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.backgroundColor = [UIColor yellowColor];
    button6.frame = CGRectMake(110,220, 70, 70);
    [button6 addTarget:self action:@selector(buttonAction6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    _semaphoret = dispatch_semaphore_create(0);
    dispatch_queue_global_t globalq = dispatch_get_global_queue(0, 0);
    NSLog(@"global  1");
    dispatch_sync(globalq, ^{
        NSLog(@"global  2");
        [self performSelector:@selector(globalRun) withObject:nil afterDelay:0];
        dispatch_async(globalq, ^{
            NSLog(@"global  3");
        });
        NSLog(@"global  4");
    });
    NSLog(@"global  5");
    XTButton *button7 = [XTButton creatButtonFrame:CGRectMake(20, 300, 90, 90) title:@"线程通知" color:[UIColor redColor]];
    [button7 addTarget:self action:@selector(button7Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    self.lock = [[NSLock alloc]init];
    XTButton *button8 = [XTButton creatButtonFrame:CGRectMake(120, 300, 90, 90) title:@"线程打开" color:[UIColor redColor]];
    [button8 addTarget:self action:@selector(button8Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    XTButton *button9 = [XTButton creatButtonFrame:CGRectMake(220, 300, 90, 90) title:@"线程锁住" color:[UIColor redColor]];
    [button9 addTarget:self action:@selector(button9Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button9];
    
    XTButton *button10 = [XTButton creatButtonFrame:CGRectMake(20,400, 90, 90) title:@"GCD" color:[UIColor redColor]];
    [button10 addTarget:self action:@selector(buttonGCDAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button10];
}
- (void)buttonGCDAction:(UIButton *)button {
    XGCDViewController *gcd = [[XGCDViewController alloc]init];
    [self.navigationController pushViewController:gcd animated:YES];
}
- (void)button9Action:(UIButton *)button {
    static int i = 0;
    i++;
    NSLog(@"lock1 %d",i);
    [self.lock lock];
     NSLog(@"lock2 %d",i);
    
}
- (void)button8Action:(UIButton *)button {
    static int i = 0;
     i++;
     NSLog(@"unlock1 %d",i);
     [self.lock unlock];
      NSLog(@"unlock2 %d",i);
}
- (void)button7Action:(UIButton *)button {
    NSLog(@"====button 777777777777777=========");
//    dispatch_group_t gt = dispatch_group_create();
//    dispatch_queue_t qt = dispatch_get_global_queue(0, 0);
//    dispatch_group_async(gt, qt, ^{
//        NSLog(@"async 11");
//    });
//    dispatch_group_async(gt, qt, ^{
//        NSLog(@"async 22");
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"async 2211");
//    });
//    dispatch_group_notify(gt, qt, ^{
//        NSLog(@"async 333");
//    });
////    dispatch_group_wait(gt, <#dispatch_time_t timeout#>)
//    dispatch_barrier_async(qt, ^{
//        NSLog(@"barrier 444");
//    });
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });

    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
    });

    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 4
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
}
- (void)globalRun {
    NSLog(@"global  6");
}
- (void)buttonAction5 {
    dispatch_semaphore_wait(_semaphoret, 0);
    NSLog(@"%s",__func__);
}
- (void)buttonAction6 {
    dispatch_semaphore_signal(_semaphoret);
    NSLog(@"%s",__func__);
}
- (void)mainAsync {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"async =---1");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"async =---2");
    });
    
    NSLog(@"async =---3");
}
- (void)exchangeThread {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"exchangeThread1---%@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"exchangeThread2---%@", [NSThread currentThread]);
        });
        NSLog(@"exchangeThread3---%@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"exchangeThread4---%@", [NSThread currentThread]);
        });
    });
}
- (void)interview1{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"1---%@",[NSThread currentThread]);
        [self performSelector:@selector(test1) withObject:nil afterDelay:.0f];
        NSLog(@"3---%@",[NSThread currentThread]);
//        [self nsthread2];
    });
}
- (void)nsthread2 {
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    dispatch_queue_t  aSerialQueue = dispatch_queue_create("iosxiao.name",DISPATCH_QUEUE_SERIAL);
    dispatch_async(aSerialQueue, ^(void) {
//        NSLog(@"==========");
//        [self funcA];
        NSLog(@"00");
    });
   
    dispatch_sync(aSerialQueue, ^(void) {
//        [self funcA];
         NSLog(@"11");
    });
    NSLog(@"22");
//    [self funcA];
    
    CFAbsoluteTime endTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"linke %f",endTime);
    
    
}
- (void)funcA {
    NSInteger i = 0;
    while (i<5) {
        sleep(1);
        NSLog(@"%@ == %@",[NSThread currentThread],@(i));
        i++;
    }
    NSLog(@"end=====%@",[NSThread currentThread]);
}
- (void)test1{
    NSLog(@"2---%@",[NSThread currentThread]);
}

- (void)buttonAction1:(UIButton *)button {
    NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
        [button setTitle:@"123" forState:UIControlStateNormal];
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
    
    XDOperation *xo = [[XDOperation alloc]init];
    [xo start];
//    [self.queue addOperation:xo];
    
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
- (void)buttonAction3 {
    NSLog(@"=======3333");
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
    NSLog(@"114");
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
