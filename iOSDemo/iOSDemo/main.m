//
//  main.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#import <FBAllocationTracker/FBAllocationTracker.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if DEBUG
        [FBAssociationManager hook];
        [[FBAllocationTrackerManager sharedManager]startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager]enableGenerations];
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
