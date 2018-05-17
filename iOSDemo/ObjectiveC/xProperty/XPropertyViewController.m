//
//  XPropertyViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XPropertyViewController.h"

@interface XPropertyViewController ()
/**
 *  atomic 默认值 通过锁定机制来确保其操作的原子性 如果两个线程同时读取一个属性，那么不论何时，总能看到有效的属性值。
 *  nonatomic 非原子性 如果该对象无需考虑多线程的情况，请加入这个属性， 使用同步锁的开销比较大， 这会带来性能问题。
 *  strong 相当于retain,这里可以替代。引数+1；默认值
 */
@property (nonatomic,strong)UIView *aView;
@property (nonatomic,retain)UIView *bView;
/**
 *  虽然这个weak 相当于assign，assign用于基础数据类型，weak必须是object类型。引数不加1；
 * 对象没有的时候，weak会把指针值为nil
 * assign 默认值
 */
@property (nonatomic,assign)NSInteger a;
/**
 *  引数不加1
 */
@property (nonatomic,weak) UIView *b;
/**
 *  copy 传说中的深拷贝，直接一个新的对象。只对实行了NSCopying协议的对象类型有效。
 *__unsafe_unretained 声明一个弱应用，但是不会自动nil化，也就是说，如果所指向的内存区域被释放了，这个指针就是一个野指针了。
 */
@property (nonatomic,unsafe_unretained)UIView *c;
@property (nonatomic,copy)NSString *str ;
@property (nonatomic,strong)NSString *str2;
//weak，strong都一样，因为storyboard已经强引用了。
@end

@implementation XPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"属性关键字";
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableString *s = [[NSMutableString alloc]initWithString: @"11"];
    self.str = s;
    self.str2 = s;
    [s appendString: @"22"];
    NSString * s2 = @"33";
    self.str = s2;
    self.str2 = s2;
    s2 = @"44";
    NSLog(@"%@  %@  %@",self.str,self.str2,s);//11  1122  1122
    NSLog(@"%@  %@  %@",self.str,self.str2,s2);//33  33  44
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
