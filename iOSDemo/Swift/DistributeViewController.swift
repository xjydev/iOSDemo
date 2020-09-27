//
//  DistributeViewController.swift
//  iOSDemo
//
//  Created by jingyuan5 on 2020/9/24.
//  Copyright © 2020 Xiaodev. All rights reserved.
/*
•值类型总是会使用直接派发, 简单易懂
•而协议和类的 extension 都会使用直接派发
•NSObject 的 extension 会使用消息机制进行派发
•NSObject 声明作用域里的函数都会使用函数表进行派发.
•协议里声明的, 并且带有默认实现的函数会使用函数表进行派发
 */
//使用静态派发结构体就可以实现，如果要使用消息派发机制就应该考虑NSObject，如果需要使用objective-C的构建框架就需要使用NSObject的子类。
//Swift中检测到一个函数被#selector 和 #keypath 引用时要自动把这些函数标记为 dynamic。
//extension 扩展里面的方法不可以重写,扩展中也不可以重写方法，不然报错。
/********派发总结********/
/*
 |         |直接派发         | 函数表派发          |消息转发|
 |NSObject |@nonobjc、final |Initial Declaration|extension{ dynamic}|
 |Class    |extension{final}|Initial Declaration|dynamic            |
 |Protocol |extension       |Initial Declaration|@objc              |
 |ValueType|All Methods     |N/A                |N/A                |
 */
import UIKit

protocol disProtocol {
    
}
struct disStruct:disProtocol {
   
}
class disPerson: NSObject {
   @objc func sayHello() {
        print("hello")
    }
}
class disSon: disPerson {
   override func sayHello() {
        print("son hello");
    }
}

//扩展直接派发。
extension disProtocol {
//    func extentsinMethod() {
//        print("disProtocol")
//    }
}
extension disStruct {
    func extentsinMethod() {
        print("disStruct")
    }
}
//dynamic 可以让类的函数使用消息转发机制
//@objc & @nonobjc 显式地声明了一个函数是否能被 Objective-C 的运行时捕获到.
//final @objc  直接派发，OC可以使用消息机制捕获perform(selector:)。
//@inline, 告诉编译器可以使用直接派发
class DistributeViewController: UIViewController {
    //final 失去动态性，直接派发
    final func vcfinalFun(){
           
       }
    override func viewDidLoad() {
        super.viewDidLoad()

        let stru = disStruct();
        let pro:disProtocol = stru;
        stru.extentsinMethod();
//        pro.extentsinMethod();
        
        let person = disPerson();
        person.sayHello();
        
        let son = disSon();
        son.sayHello();
        
    }

}

