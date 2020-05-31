//
//  XKVOViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XKVOViewController.h"
#import "XShareInstance.h"
#import "XShareInstance+cate.h"
#import "XKVCViewController+cate.h"
#import <objc/runtime.h>
@interface XKVOViewController ()
{
    NSObject *_ob;
}
@property (nonatomic, copy)NSString *str;
@property (nonatomic, copy)NSString *objStr;
@end

@implementation XKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[XShareInstance share] addObserver:self forKeyPath:@"kvoStr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"str" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notifySelector) name:@"notify" object:nil];
    __weak typeof(self)weakS = self;
  _ob = [[NSNotificationCenter defaultCenter]addObserverForName:@"notify" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"note == %@ %@",note,weakS);
    }];
    
}
- (void)notifySelector {
    NSLog(@"%s",__func__);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"observe \n %@  %@   %@",keyPath,change,context);
}
- (void)dealloc {
    [[XShareInstance share] removeObserver:self forKeyPath:@"kvoStr"];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:_ob];
    NSLog(@"%s",__func__);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[XShareInstance share] setObjectNum:@(1)];
    self.str = @"123";
    NSLog(@"self == %@ ",self.class);
    objc_getClass("");
    
}
+ (BOOL)automaticallyNotifiesObserversOfStr {
    return NO;
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
