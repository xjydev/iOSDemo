//
//  XScreenProjectionViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/11/16.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XScreenProjectionViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPVolumeView.h>
@interface XScreenProjectionViewController ()
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) MPVolumeView *airplayPickerView;

@end

@implementation XScreenProjectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.airplayPickerView = [[MPVolumeView alloc] init];
    self.airplayPickerView.frame = CGRectMake(100, 100, 200,100);
    self.airplayPickerView.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.airplayPickerView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //http://plmedia.live.weibo.com/alicdn/4569718763560105_wb480.flv
    //https://xiaodev.com//APP/video.mp4
    //http://ivi.bupt.edu.cn/hls/cctv10.m3u8
    if ([self isAirPlay]) {
        NSLog(@"start play ===================================");
        self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://ivi.bupt.edu.cn/hls/cctv10.m3u8"]];
        //http://plmedia.live.weibo.com/alicdn/4569718763560105_wb480.flv
        self.avPlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        [self.avPlayer addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
       
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [[change objectForKey:NSKeyValueChangeNewKey] intValue];
        NSLog(@"avstatus == %@",@(status));
        switch (status) {
            case AVPlayerItemStatusFailed:{
                
            }
                break;
            case AVPlayerItemStatusReadyToPlay:{
                [self.avPlayer play];
            }
                break;
            case AVPlayerItemStatusUnknown:{
                
            }
                break;
            default:
                break;
        }
    }
    [object removeObserver:self forKeyPath:@"status"];
}
- (BOOL)isAirPlay{
    AVAudioSession* audioSession = [AVAudioSession sharedInstance];
    AVAudioSessionRouteDescription* currentRoute = audioSession.currentRoute;
    for (AVAudioSessionPortDescription* outputPort in currentRoute.outputs){
        if ([outputPort.portType isEqualToString:AVAudioSessionPortAirPlay])
            return YES;
    }
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
