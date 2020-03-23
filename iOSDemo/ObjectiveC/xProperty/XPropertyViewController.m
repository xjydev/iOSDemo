//
//  XPropertyViewController.m
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

#import "XPropertyViewController.h"
#import "XModel.h"

const NSString * ExternStr = @"externStr";

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
//    XModel *model1 = [[XModel alloc]init];
//    model1.aindex = 111;
//    XModel2 *model2 = [[XModel2 alloc]init];
//    model2.aindex = 222;
//    XModel *model3 = [XModel copy];
//    model3.aindex = 333;
//    XModel2 *model4 = [XModel2 copy];
//    model4.aindex = 444;

//    NSLog(@"%d\n%d\n%d\n%d\n",model1.aindex,model2.aindex,model3.aindex,model4.aindex);
    [self theKeyWord];
    NSMutableString *cstrd = [NSMutableString stringWithFormat:@"123"];
     NSMutableString *cstrd1 = [NSMutableString stringWithFormat:@"234"];
    //由于NSString是指针变量，因此只要保证NSString类型的变量存储的指针不可变就可以定义一个不可更改的NSString变量
    const NSMutableString *cstr = cstrd;//指针可变，值不可变。
    NSMutableString *const cstr2 = cstrd1;//指针不可变，值可变。
    NSLog(@"const1 == %@ - %@",cstr,cstr2);
    [cstrd appendFormat:@"456"];
    [cstrd1 appendFormat:@"567"];
    
     NSLog(@"const2 == %@ - %@",cstr,cstr2);
    int a = 2;
    int a1 = 3;
    int a2 = 4;
    
    int const *b = &a;
    int * const b1 =&a1;
    NSLog(@"a == %d  %d",*b,*b1);
    a = 5;
//    b1 = &a2;//指针不可以修改。
    a1 = 5;
    
    NSLog(@"a == %d  %d",*b,*b1);
    
    
    

}

#pragma mark -- 关键字

static int sta1 = 2;//本来是在整个源程序的所有文件都可见，static修饰后，改为只在申明自己的文件可见，即修改了作用域。
int sta2 = 3;

- (void)theKeyWord {
     static int sta = 1;//static修饰局部变量：将局部变量的本来分配在栈区改为分配在静态存储区，也就改变了局部变量的生命周期。
    const int coa = 10;//在栈区分配一块区域，coa这块儿内存中的值不可修改。
    const NSString *coStr = @"123";//*coStr指针指向的内存值不可以修改，但是coStr这个指针是可以变的。
    coStr = @"234";
    NSString * const coStr1 = @"456";
//    coStr1 = @"567";//coStr1指针指向的内存地址不能变。指向不能变。
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
