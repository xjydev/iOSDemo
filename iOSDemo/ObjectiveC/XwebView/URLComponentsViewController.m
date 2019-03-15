//
//  URLComponentsViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2019/3/14.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

#import "URLComponentsViewController.h"

@interface URLComponentsViewController ()

@end

@implementation URLComponentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *schemeStr = @"ab:/anbanhoume?e=234&b=z中文";
    
//    if (@available(iOS 8.0, *)) {
        schemeStr = [schemeStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"hString = %@",schemeStr);
    NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
    
    //传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:schemeStr];
    
    //回调遍历所有参数，添加入字典
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [parm setObject:obj.value forKey:obj.name];
    }];
    
    NSLog(@"parm ======= %@",parm);
    NSLog(@"%@",[parm objectForKey:@"b"]);
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
