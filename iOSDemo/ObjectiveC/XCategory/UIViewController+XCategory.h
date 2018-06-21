//
//  UIViewController+XCategory.h
//  iOSDemo
//
//  Created by XiaoDev on 2018/6/21.
//  Copyright © 2018 Xiaodev. All rights reserved.
//
//http://www.cocoachina.com/ios/20170502/19163.html
/** category 作用 **/
//1.为已经存在的类添加方法
//2.可以减少单个文件的体积
//3.可以把不同的功能组织到不同的category里
//4.可以由多个开发者共同完成一个类
//5.可以按需加载想要的category
//6.声明私有方法
/** category特点 **/

//category只能给某个已有的类扩充方法，不能扩充成员变量。
//
//category中也可以添加属性，只不过@property只会生成setter和getter的声明，不会生成setter和getter的实现以及成员变量。
//
//如果category中的方法和类中原有方法同名，运行时会优先调用category中的方法。也就是，category中的方法会覆盖掉类中原有的方法。所以开发中尽量保证不要让分类中的方法和原有类中的方法名相同。避免出现这种情况的解决方案是给分类的方法名统一添加前缀。比如category_。
//
//如果多个category中存在同名的方法，运行时到底调用哪个方法由编译器决定，最后一个参与编译的方法会被调用。

//分类(category) > 本类 > 父类。即，优先调用cateory中的方法，然后调用本类方法，最后调用父类方法。
#import <UIKit/UIKit.h>

@interface UIViewController (XCategory)

@end
