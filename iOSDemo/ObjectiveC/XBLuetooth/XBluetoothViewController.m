//
//  XBluetoothViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/4/19.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XBluetoothViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
@interface XBluetoothViewController ()<CBCentralManagerDelegate>
@property(nonatomic,strong)CBCentralManager *centralManager;
@end

@implementation XBluetoothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
}
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"bluetooth state == %@",@(central.state));
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
