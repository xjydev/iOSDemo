//
//  ABCalendarController.h
//  iOSDemo
//
//  Created by XiaoDev on 2018/8/10.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CalendarSelectedCompletion)(NSDate *startDate,NSDate *endDate);

@interface ABCalendarController : UIViewController
- (BOOL)showSelectedCompletion:(CalendarSelectedCompletion)selectedCompletion;
@end
