//
//  ThirdViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/23.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "ThirdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/SDWebImage.h>
#import <AVKit/AVKit.h>
@interface ThirdViewController ()
@property (nonatomic, strong)NSString *hah;
@property (nonatomic, strong)UIButton *button;
@end

@implementation ThirdViewController
- (void)loadView {
    NSLog(@"%s",__func__);
//   self.button =[UIButton buttonWithType:UIButtonTypeCustom];
//    self.button.backgroundColor = [UIColor redColor];
//    [self.button setTitle:@"背景" forState:UIControlStateNormal];
//    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    self.view = [[UIView alloc]init];
    int a = 10;
    NSInteger b = 20;
    NSLog(@"button == %p &button == %p %p",_button,&_button,&a);
    
    NSLog(@"%p",&b);
//    [super loadView];
}
- (void)buttonAction {
    NSLog(@"%s",__func__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMutableArray
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor blueColor];
//    @synchronized (<#token#>) {
//
//    }
//    NSOperation
    NSLog(@"selector1 %@",NSStringFromSelector(@selector(selectorName)));
    NSLog(@"selector2 %@",NSStringFromSelector(@selector(seletorNa)));
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:@"" parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"1%@",self.hah);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"2%@",self.hah);
//    }];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 120, 100, 100)];
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString: @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585640348285&di=2c3a536ae352e72522ab4d2436f60eba&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F08f790529822720e9e8a7a957bcb0a46f21fab1d.jpg"] placeholderImage:nil];
//    NSURLSession;
//    NSURLConnection;
//    AVPlayer;
//    AVPlayerLayer;
//    AVPlayerItem;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)dealloc {
    NSLog(@"%s",__func__);
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
