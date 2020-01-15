//
//  XStringViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 2018/11/19.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XStringViewController.h"

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
