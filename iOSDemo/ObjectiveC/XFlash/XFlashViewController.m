//
//  XFlashViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/5/7.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "XFlashViewController.h"
#import <SVGAPlayer/SVGAPlayer.h>
#import <SVGAPlayer/SVGAParser.h>
@interface XFlashViewController ()

@end

@implementation XFlashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    SVGAPlayer *player = [[SVGAPlayer alloc] initWithFrame:CGRectMake(0, 50, 300, 300)];
    player.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:player];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
//    [parser parseWithURL:[NSURL URLWithString:@"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true"] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        if (videoItem != nil) {
//            player.videoItem = videoItem;
//            [player startAnimation];
//        }
//
//    } failureBlock:^(NSError * _Nullable error) {
//       NSLog(@"error == %@",error);
//    }];
    NSString *path = @"/Users/xiaodev/Desktop/test1.swf";
    NSData *data = [NSData dataWithContentsOfFile:path];
    [parser parseWithData:data cacheKey:@"" completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (videoItem != nil) {
            player.videoItem = videoItem;
            [player startAnimation];
        }
    } failureBlock:^(NSError * _Nonnull error) {
      NSLog(@"error == %@",error);
    }];
//    [[NSBundle mainBundle]pathForResource:@"flash1" ofType:@"swf"];
//    [parser parseWithURL:[NSURL fileURLWithPath:path] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        if (videoItem != nil) {
//            player.videoItem = videoItem;
//            [player startAnimation];
//        }
//    } failureBlock:^(NSError * _Nullable error) {
//        NSLog(@"error == %@",error);
//    }];
    
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
