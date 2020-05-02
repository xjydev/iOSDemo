//
//  XStoreViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/13.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XStoreViewController.h"

@interface XStoreViewController ()

@end

@implementation XStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def registerDefaults:@{@"22":@"21"}];
    NSLog(@"22== %@",[def objectForKey:@"22"]);
    [def setValue:@"11" forKey:@"22"];//优先级高
    NSLog(@"21== %@",[def objectForKey:@"22"]);
    
     NSLog(@"23== %@",[def objectForKey:@"ke"]);
    NSLog(@"defaults == %@",def.dictionaryRepresentation);
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
