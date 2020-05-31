//
//  ProtocolViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/15.
//  Copyright © 2019 Xiaodev. All rights reserved.
//使用 mutating 关键字标记，这表明当它被调用时，该方法将会改变遵循协议的类型的实例：
//required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
//如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符：
//标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类遵循
//在协议中使用 optional 关键字作为前缀来定义可选要求
//泛型版本的函数使用占位符类型名（这里叫做 T ），而不是 实际类型名
//和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。 加上关键字 unowned 表示这是一个无主引用。 你可以通过 unowned(unsafe) 来声明不安全无主引用
//一个属性的值允许为 nil，而另一个属性的值不允许为 nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。

//In-Out(输入输出)参数，它的作用是通过函数修改参数的值.如果你想让函数改变形参值，并想要在函数调用结束后保持形参值的改变，那你可以把形参定义为in-out形参。
import UIKit

protocol SomeProtocol:UITableViewDelegate {
    static var someTypeProperty:Int {get set}
    var mustBeSettable:Int{get set}
}

@objc protocol ProtocolDelegate {
    func protocolTransfor(para:Int);
  @objc  optional func protocolOptionalTransfor(para:Int);
}

class ProtocolViewController: UIViewController,ProtocolDelegate {
    func protocolTransfor(para: Int) {
        print("protocol =====",para);
    }
    var osa:Int = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
        print(XDScreenWidth,XDScreenHeight);
        self.view.backgroundColor = UIColor.white;
        self.title = "协议"
        let pv:protocolView = protocolView()
        pv.delegate = self
        pv.doProtocol(p: 2)
        var  m  = 10;
        var n = 12;
        swapTwoValues(a: &m, b: &n);
        print(m,n);
        var person:Person?
        var man:Man?
        person = Person(name: "xiao");
        man = Man(name: "yuan");
        person!.man = man;
        man!.person = person;
        person = nil;
        man = nil;
        
        var customer:Customer?
        customer = Customer(name: "A")
        let card:CreditCard = CreditCard(customer: customer!);
        print(card.name)
        customer = nil
        
        increment(number: &osa);
        print(osa);
        var inouta = 3;
        increment(number: &inouta);
        print(inouta);
        
    }
    func increment (number:inout Int ) {
        number = 4;
    }
    func swapTwoValues<T>(a:inout T,b:inout T) {
        let c = a;
        a = b;
        b = c;
        
    }

}

class protocolView {
   var delegate:ProtocolDelegate?
    func doProtocol(p:Int) {
        delegate?.protocolTransfor(para: p+10);
    }
}
//MARK:强引用弱引用弱引用（weak reference）和无主引用（unowned reference）。
class Person {
    let name:String
    init(name:String) {
        self.name = name;
    }
    var man:Man?
    deinit {
        print("person deinit")
    }
}
class Man {
    let name:String
    init(name:String) {
        self.name = name;
    }
   weak var person:Person?
    deinit {
        print("man deinit")
    }
}
protocol nameProtocol {
    var name:String {get set}
}

class CreditCard : nameProtocol {
    var name: String = ""
   unowned let customer:Customer
    init(customer:Customer) {
        self.customer = customer;
        self.name = customer.name
    }
    deinit {
        print("CreditCard deinit")
    }
}
class Customer:nameProtocol {
    var name: String = ""
    let card:CreditCard?
    init(name:String) {
        self.name = name;
        self.card = nil
    }
    deinit {
        print("Customer deinit")
    }
}

