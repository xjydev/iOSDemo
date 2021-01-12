//
//  XPlayerViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/7.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XPlayerViewController.h"
#import <AVKit/AVKit.h>
@interface XPlayerViewController ()

@end

@implementation XPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:@""];
    AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:item];
    
    //信息中断恢复
//    AVAudioSessionInterruptionNotification
//    AVAudioSessionRouteChangeNotification
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
