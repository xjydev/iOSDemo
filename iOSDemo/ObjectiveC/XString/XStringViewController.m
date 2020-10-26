//
//  XStringViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/11/19.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XStringViewController.h"
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <net/if.h>

@interface XStringViewController ()
@property (weak, nonatomic) IBOutlet UITextField *stringField;
@property (weak, nonatomic) IBOutlet UITextField *sting2Field;
@property (weak, nonatomic) IBOutlet UILabel *stringLabel;

@end

@implementation XStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字符串操作";
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str1 = @"123456";
    NSString *str2 = @"ab1234";
    NSString *str3 = @"说话ab12";
    NSLog(@"host == %@",[self syncFetchIPAddressWithHost:@""]);
    NSLog(@"host1 == %@",[self syncFetchIPAddressWithHost:nil]);
    NSLog(@"length = %ld %ld %ld",str1.length,str2.length,str3.length);
    //半角符长度
    NSLog(@"UTF = %ld %ld %ld",[str1 lengthOfBytesUsingEncoding:NSNonLossyASCIIStringEncoding],[str2 lengthOfBytesUsingEncoding:NSNonLossyASCIIStringEncoding],[str3 lengthOfBytesUsingEncoding:NSNonLossyASCIIStringEncoding]);
    NSLog(@"isa = %ld %ld %ld",[self halfLength:str1],[self halfLength:str2],[self halfLength:str3]);
    
//    _stringLabel.text = @"这是一个折行的字符串适配计算大小的空间真的是空间";
//    CGSize thatsize = [_stringLabel sizeThatFits:CGSizeZero];
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 20)];
    testLabel.numberOfLines = 0;
    testLabel.text = @"这是一个折行的字符串适配计算大小的空间真的是空间";
    testLabel.font = [UIFont systemFontOfSize:14];
    testLabel.textAlignment=NSTextAlignmentCenter;
    //使用sizeThatFit计算lable大小
//    CGSize sizeThatFit=[testLabel sizeThatFits:CGSizeZero];
//    NSLog(@"%f--1---%f", sizeThatFit.width, sizeThatFit.height);
    //343.000000--1---17.000000
    CGSize sizeThatFit=[testLabel sizeThatFits:CGSizeMake(100, 100)];
      NSLog(@"%f--1---%f", sizeThatFit.width, sizeThatFit.height);//100.000000--1---67.000000
    NSLog(@"%f--2---%f", testLabel.frame.size.width, testLabel.frame.size.height);//100.000000--2---20.000000
    // 调用sizeToFit
    [testLabel sizeToFit];
    NSLog(@"%f--3---%f", testLabel.frame.size.width, testLabel.frame.size.height);//100.000000--3---67.000000
    testLabel.textColor=[UIColor blackColor];
    testLabel.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:testLabel];
    NSLog(@"containt 1-- %@",[self contentStr:@"NT:" inData:@"0123NT:44567\r\n"]);
    
    NSLog(@"containt 2 -- %@",[self contentStr:nil inData:@"12\r\n23"]);
    
    NSLog(@"containt 3 -- %@",[self contentStr:@"1234" inData:@"\r\n123"]);
    
    NSLog(@"containt 4 -- %@",[self contentStr:@"1234" inData:@"3"]);
//    [self contentStr:nil inData:nil];
}
- (NSInteger)halfLength:(NSString *)text {
    NSInteger len = 0;
    for (NSInteger i = 0; i<text.length; i++) {
        unichar uc = [text characterAtIndex:i];
        len += isascii(uc)?1:2;
    }
    return len;
}
- (IBAction)startAction:(id)sender {
    NSLog(@"%@\n空格==%@\n星星==%@\n",self.stringField.text,[self showPlainText:YES text:self.stringField.text],[self showPlainText:NO text:self.stringField.text]);
    [self replaceString:self.sting2Field.text];
}
- (void)replaceString:(NSString *)str {
    NSMutableString *mstr = [[NSMutableString alloc]initWithString:self.stringField.text];
    NSRange range = NSMakeRange(5, 4);
    if (range.location > mstr.length) {
        return;
    }
//    else if (range.length + range.location > mstr.length) {
//        range.length = mstr.length - range.location;
//    }
    [mstr replaceCharactersInRange:range withString:str];
    NSLog(@"mst == %@",mstr);
}
//
- (NSString *)showPlainText:(BOOL)show text:(NSString *)text {
//    if (text.length == 0) {
//        return nil;
//    }
//    NSMutableString *mstr = [NSMutableString stringWithString:text];
//    if (show) {//如果显示就添加空格和#号
//        NSInteger count = 1;
//        while (count < mstr.length) {
//            if (count % 5 == 0) {//每第五个添加一个空格
//                [mstr insertString:@" " atIndex:count];
//            }
//            count ++;
//        }
//        return [NSString stringWithFormat:@"%@ #", mstr];
//    }
//    else//如果不显示就显示*号
//    {
//        NSInteger count = 0;
//        while (count < mstr.length) {
//            if (count % 5 == 0&& count!=0) {//每第五个添加一个空格
//                [mstr insertString:@" " atIndex:count];
//            } else {
//                [mstr replaceCharactersInRange:NSMakeRange(count, 1) withString:@"*"];
//            }
//            count ++;
//        }
//        return mstr;
//    }
    NSInteger length = text.length;
    NSInteger cycleCount = length / 5 + length;//加上空格后字符串长度
    NSInteger count = 1;
    NSMutableString *mstr = [NSMutableString stringWithCapacity:cycleCount];
    
    if (show) {//如果显示就添加空格和#号
        
        NSInteger copyCount = 0;
        while (mstr.length < cycleCount) {
            if (count % 5 == 0) {
                [mstr appendFormat:@" "];
            } else {
                [mstr appendString:[text substringWithRange:NSMakeRange(copyCount, 1)]];
                copyCount ++;
            }
            count ++;
        }
        
        return [NSString stringWithFormat:@"%@ #", mstr];
    }
    
    //如果不显示就
    while (mstr.length < cycleCount) {
        if (count % 5 == 0) {
            [mstr appendFormat:@" "];
        } else {
            [mstr appendFormat:@"*"];
        }
        count ++;
    }
    return mstr;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self arrayCopy];
}
- (void)arrayCopy {
    NSString *str = @"1234";
    NSMutableString * mst = [NSMutableString stringWithString:@"456"];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:str,mst, nil];
    NSArray *ar = [arr copy];
    NSMutableArray *arr2 = [arr mutableCopy];
    
    NSLog(@"%p %p  %p %p",str,ar,arr,arr2);
     NSLog(@"%p %p  %p %p",str,ar.firstObject,arr.firstObject,arr2.firstObject);
    NSLog(@"%p %p  %p %p",mst,ar.lastObject,arr.lastObject,arr2.lastObject);
}
- (NSString *)contentStr:(NSString *)key inData:(NSString *)data {
   
    NSString *str = data;
//    if (str == nil || key == nil) {
//        return @"";
//    }
//
//    NSRange keyRange = [str rangeOfString:key options:NSCaseInsensitiveSearch];
//
//    if (keyRange.location == NSNotFound){
//        return @"";
//    }
//
//    str = [str substringFromIndex:keyRange.location + keyRange.length];
//
    NSRange enterRange = [str rangeOfString:@"\r\n"];
    if (enterRange.location == NSNotFound) {
        return str;
    }
    NSString *value = [[str substringToIndex:enterRange.location] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return value;
}
- (NSString *)syncFetchIPAddressWithHost:(NSString *)host
{
    if (host == nil || host.length == 0 ) {
        return nil;
    }
    NSString *address = nil;
    const char * hostAdd = [host UTF8String];
    CFStringRef hostNameRef = CFStringCreateWithCString(kCFAllocatorDefault, hostAdd, kCFStringEncodingASCII);
    CFHostRef hostRef = CFHostCreateWithName(kCFAllocatorDefault, hostNameRef);
    
    if (CFHostStartInfoResolution(hostRef, kCFHostAddresses, NULL))
    {
        Boolean result = false;
        CFArrayRef addresses = CFHostGetAddressing(hostRef, &result);
        if (result) {
            struct sockaddr *remoteAddress;
            for (int i = 0; i < CFArrayGetCount(addresses); i++)
            {
                CFDataRef saData = (CFDataRef)CFArrayGetValueAtIndex(addresses, i);
                remoteAddress = (struct sockaddr *)CFDataGetBytePtr(saData);
                if (remoteAddress != NULL) {
                    if (remoteAddress->sa_family == AF_INET) {
                        struct sockaddr_in *remoteAddressV4 = (struct sockaddr_in *)remoteAddress;
                        char ipv4[INET_ADDRSTRLEN];
                        if (inet_ntop(AF_INET, (void *)&(remoteAddressV4->sin_addr), ipv4, INET_ADDRSTRLEN) != NULL)
                            address = [NSString stringWithUTF8String:ipv4];
                    }
                    else if (remoteAddress->sa_family == AF_INET6) {
                        struct sockaddr_in6 *remoteAddressV6 = (struct sockaddr_in6 *)remoteAddress;
                        char ipv6[INET6_ADDRSTRLEN];
                        if (inet_ntop(AF_INET6, (void *)&(remoteAddressV6->sin6_addr), ipv6, INET6_ADDRSTRLEN) != NULL)
                            address = [NSString stringWithUTF8String:ipv6];
                    }
                    break;
                }
            }
        }
    }
    if (address == nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
//            [WBNLCurrentLogManager getPlayerErrorCode:9999 errortype:WBPlayDNSError];
//            [WBNLCurrentLogManager getPlayerErrorDomain:@"dns ip error"];
//            [WBNLCurrentLogManager getPlayerErrorMsg:WBPlayState * 10 + WBMLVideoLiveLogPlayerTypeWBPLAYER];
        });
    }
    CFRelease(hostRef);
    CFRelease(hostNameRef);
    return address;
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
