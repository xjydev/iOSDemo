//
//  XThread2ViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XThread2ViewController.h"

@interface XThread2ViewController ()

@end

@implementation XThread2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.arr addObserver:self forKeyPath:@"xiaoDD" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"change %@",change);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//      self.arr.xiaoDD=@"123";
        [self.arr willChangeValueForKey:@"xiaoDD"];
        [self.arr didChangeValueForKey:@"xiaoDD"];
        
    });
//    
    
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
