//
//  XRetainCyViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XRetainCyViewController.h"

@interface XRetainCyViewController ()
@property (nonatomic, strong)NSTimer *timer1;
@property (nonatomic, strong)NSTimer *timer2;
@property (nonatomic, strong)NSTimer *timer3;
@property (nonatomic, strong)NSString *proStr;
@property (nonatomic, strong)dispatch_source_t gtimer;
@end

@implementation XRetainCyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self nsTimer];
//    [self nsNotificationCenter];
    [self GCDTimer];
    
}
- (void)GCDTimer {
    if (self.gtimer) {
        dispatch_cancel(self.gtimer);
        self.gtimer = nil;
    }
    self.gtimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0*NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0*NSEC_PER_SEC);
    NSLog(@"111 %@",@(1.0*NSEC_PER_SEC));
    dispatch_source_set_timer(self.gtimer, start, interval, 0);
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(self.gtimer, ^{
        //定时器需要执行的操作
        [weakSelf timerSelector];
       
    });
    //启动定时器（默认是暂停）
    dispatch_resume(self.gtimer);
    
}
- (void)nsTimer {
//   self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerSelector) userInfo:nil repeats:YES];
    __weak typeof(self)weakS = self;
  self.timer2 =  [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@",weakS);
    }];
}
- (void)timerSelector {
    NSLog(@"%s",__func__);
}
- (void)nsNotificationCenter {
    [[NSNotificationCenter defaultCenter]addObserverForName:@"" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",self);
    }];
    
}
- (void)notificationCenterAction {
}
- (void)kvoFuncation {
    [self.proStr addObserver:self forKeyPath:@"proStr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",context);
}
- (void)dealloc {
    [self.timer2 invalidate];
//    [self removeObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#>]
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
