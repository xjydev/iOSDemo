//
//  LottieViewController.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/12/1.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "LottieViewController.h"
#import <SVGAPlayer/SVGAPlayer.h>
#import <SVGAPlayer/SVGA.h>
#import <mach/mach_time.h>
#import "XTools.h"
@interface LottieViewController ()<SVGAPlayerDelegate>
{
    UInt64 _startTime;
    UInt64 _endTime;
}
@property (nonatomic, strong)SVGAPlayer *player;
@property (nonatomic, strong)SVGAParser *parser;

@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:50];
    label.textColor = [UIColor whiteColor];
    label.text = @"背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景背景景背景背景背景景背景背景背景景背景背景背景景背景背景背景景背景背景背景背景背景背景背景背景背景背景背景背景";
    [self.view addSubview:label];
    [self.view addSubview:self.player];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, kScreen_Height - 60, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"本地动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showLocationAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
  
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(kScreen_Width - 150, kScreen_Height - 60,100, 40);
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"网络动画" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
   
}
- (SVGAPlayer *)player{
    if (!_player) {
        _player = [[SVGAPlayer alloc]init];
        _player.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Width);
        _player.loops = 1;
        _player.clearsAfterStop = YES;
        _player.delegate = self;
    }
    return _player;
}
- (void)viewDidLayoutSubviews {
    _player.center = self.view.center;
}
- (SVGAParser *)parser {
    if (!_parser) {
        _parser = [[SVGAParser alloc] init];
    }
    return _parser;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _startTime = mach_absolute_time();
    [self showAnimation];
}
- (void)showLocationAnimation {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"la" ofType:@"svga"];
    [self.parser parseWithURL:[NSURL fileURLWithPath:path] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
        NSLog(@"start ---------");
        self.player.videoItem = videoItem;
        [self.player startAnimation];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@",error);
    }];
//    [self.parser parseWithNamed:@"la.svga" inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
//        NSLog(@"start ---------");
//        self.player.videoItem = videoItem;
//        [self.player startAnimation];
//    } failureBlock:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@",error);
//    }];
}
- (void)showAnimation {
    static int a = 0;
    NSArray *items = @[
                       @"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/HamburgerArrow.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/PinJump.svga?raw=true",
                       @"https://github.com/svga/SVGA-Samples/raw/master/Rocket.svga",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/TwitterHeart.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/Walkthrough.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true",
                       @"http://weiyinyue.music.sina.com.cn/weibo_media_admin/file/medialive/testeffect.svga"
                       ];
   
//    parser.enabledMemoryCache = YES;
    //items[a % items.count]
    [self.parser parseWithURL:[NSURL URLWithString:items.lastObject]
         completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             if (videoItem != nil) {
                 self.player.videoItem = videoItem;
                 NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
                 [para setLineBreakMode:NSLineBreakByTruncatingTail];
                 [para setAlignment:NSTextAlignmentCenter];
                 NSAttributedString *str = [[NSAttributedString alloc]
                                            initWithString:@"Hello, World! Hello, World!"
                                            attributes:@{
                                                NSFontAttributeName: [UIFont systemFontOfSize:28],
                                                NSForegroundColorAttributeName: [UIColor whiteColor],
                                                NSParagraphStyleAttributeName: para,
                                            }];
                 [self.player setAttributedText:str forKey:@"banner"];

                 [self.player startAnimation];
                 
//                 [self.aPlayer startAnimationWithRange:NSMakeRange(10, 25) reverse:YES];
             }
    } failureBlock:^(NSError * _Nullable error) {
        
    }];
    a++;
}
#pragma - mark SVGAPlayer Delegate
- (void)svgaPlayerDidAnimatedToPercentage:(CGFloat)percentage {
    if (percentage < 0.02) {
        _endTime = mach_absolute_time();
        NSLog(@"t ==== %llu",_endTime - _startTime);
    }
    NSLog(@"p == %@",@(percentage));
}
- (void)svgaPlayerDidAnimatedToFrame:(NSInteger)frame {
    NSLog(@"f == %@",@(frame));
}
- (void)svgaPlayerDidFinishedAnimation:(SVGAPlayer *)player {
   
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
