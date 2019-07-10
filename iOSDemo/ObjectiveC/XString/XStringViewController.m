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
