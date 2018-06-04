//
//  XcalendarViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 04/06/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XcalendarViewController.h"
#import "XYCalendarView.h"
@interface XcalendarViewController ()

@end

@implementation XcalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日历";
    self.view.backgroundColor = [UIColor whiteColor];
    XYCalendarView *calendarView = [[XYCalendarView alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 340)];
    [self.view addSubview:calendarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
