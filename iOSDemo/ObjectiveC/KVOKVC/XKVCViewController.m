//
//  XKVCViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XKVCViewController.h"
#import "XTButton.h"
#import "XShareInstance.h"
#import "XKVOViewController.h"
#import "XKVCViewController+cate.h"
@interface XKVCViewController ()
{
    NSNumber *_nokey;
    int    _intKey;
    
}
@property (nonatomic, copy)NSString *keyStr;
@property (nonatomic, strong)NSNumber *number;
@end

@implementation XKVCViewController
@synthesize number = _num;
- (void)setKeyStr:(NSString *)keyStr {
    _keyStr = keyStr;
    NSLog(@"set  == %@",keyStr);
    
}
+ (void)haha {
    NSLog(@"haha");
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self performSelector:@selector(haha)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setValue:nil forKey:@"intKey"];
    
    [self setValue:@1 forKey:@"_nokey"];
    NSLog(@"%@",[self valueForKey:@"nokey"]);
    self.keyStr = @"123";
    [self setValue:@"456" forKey:@"keyStr"];
    
    XTButton *button = [XTButton creatButtonFrame:CGRectMake(100, 120, 100, 100) title:@"++" color:[UIColor redColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)buttonAction:(UIButton *)buttton {
    [XShareInstance share].kvoStr = @"123";
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notify" object:nil];
    self.a = @(1);
}
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}
- (void)setNilValueForKey:(NSString *)key {//对非对象传nil
    NSLog(@"11=======%s  %@",__func__,key);

}
- (id)valueForUndefinedKey:(NSString *)key {//不存在的key取值。
    NSLog(@"22=======%s  %@",__func__,key);
    return nil;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {//不存在的key赋值。
    NSLog(@"33======= %s  %@",__func__,key);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"observe \n %@  %@   %@",keyPath,change,context);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XKVOViewController *vc = [[XKVOViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
