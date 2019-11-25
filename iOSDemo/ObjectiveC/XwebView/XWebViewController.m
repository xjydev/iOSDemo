//
//  XWebViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/11/20.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XWebViewController.h"
#import <WebKit/WebKit.h>
@interface XWebViewController ()<WKUIDelegate>

@end

@implementation XWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    webView.UIDelegate = self;
    [self.view addSubview:webView];
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
