//
//  ConstructorViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/10.
//  Copyright © 2019 Xiaodev. All rights reserved.
//构造器
//可选类型的属性将自动初始化为 nil
//指定构造器 :是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并调用合适的父类构造器让构造过程沿着父类链继续往上进行。
//普遍的是一个类只拥有一个指定构造器,每一个类都必须至少拥有一个指定构造器.
//便利构造器:convenience 关键字 是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为部分形参提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入值的实例。
//原则：指定构造器必须调用其直接父类的的指定构造器。便利构造器必须调用同类中定义的其它构造器。便利构造器最后必须调用指定构造器。子类不能直接调用父类的便利构造器
//安全检查
//指定构造器必须保证它所在类的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
//指定构造器必须向上代理调用父类构造器。如果没这么做，指定构造器赋予继承的属性的新值将被父类中的构造器所覆盖。
//便利构造器必须先代理调用其它构造器。如果没这么做，便利构造器赋予任意属性（包括所有同类中定义的）的新值将被该类的指定构造器所覆盖。
//构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用 self 作为一个值
//MARK:构造器的自动继承
//如果子类没有定义任何指定构造器，它将自动继承父类所有的指定构造器。
//如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承父类所有的便利构造器。

//MARK:析构器
//析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字 deinit 来标示，类似于构造器要用 init 来标示。

//MARK:可选链式调用
//类型检查操作符（is）来检查一个实例是否属于特定子类型
import UIKit
enum MyError:Error {
    case invalidSelection
    case insufficientFunds(errco:Int)
    case outOfStock
}
class ConstructorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "构造器"
        let v = Vehicle(speed: 23)!;
        print(v.description)
        v.makeNoise();
        let v2 = Vehicle(speed: -10);
        print(v2?.description as Any);
        let car = Car(speed: 110);
        car.gear = 2;
        car.speed = 100;
        print(car.description);
        car.makeNoise();
        do {
//            try createError(name: "123")
        } catch MyError.insufficientFunds(let errco) {
            print("error \(errco)");
        }
    }
    
    
    
    func createError(name:String) throws {
        throw MyError.insufficientFunds(errco: 10);
    }
    
    
    deinit {
        print("== deinit ==")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Vehicle {
    var speed:Double = 0.0;
    final var cycle:Float = 100;
    var wheel:Wheel?
    
    init?(speed:Double) {//可失败构造器
        if speed<0.0 {
            return nil
        }
        self.speed = speed
    }
    convenience init(){
        self.init(speed:2.0)!
    }
    var description :String {
       return "traveling at \(speed) milses per hour"
    }
    func makeNoise() {
      print("noise")
    }
}
class Wheel {
    var hub = 1;
    
}
class Bicycle: Vehicle {
    var hasBasket = false
    override func makeNoise() {
        print("bibi")
    }
}
class Car: Vehicle {
    var gear:Int = 1
    init(speed: Double,gear:Int) {
        self.gear = gear;
        super.init(speed: speed)!;
    }
    override convenience init(speed: Double) {
        self.init(speed:speed,gear:10);
    }
    override var speed: Double {
        willSet {
            print("will set speed \(speed)");
        }
        didSet {
            gear = Int(speed/10.0)+1;
        }
        
    }
    override var description: String {
        return super.description + "in \(gear)";
    }
    
}
