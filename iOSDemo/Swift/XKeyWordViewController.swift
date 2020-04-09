//
//  XKeyWordViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/23.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

protocol personProtocol {
    var sex:Int {get set}
}

struct man {
    static func name() {
        print("man name");
    }
    var _sex = 1;
    
    var namestr:String?
    var sex:Int {
        set {
            _sex = newValue;
        }
        get {
            return 1;
        }
    }
}
struct boy : personProtocol {//只能遵循协议
    
    var _sex:Int = 1;
    var sex: Int {
        set {
            _sex = 1;
        }
        get {
            return _sex;
        }
    }
}

class Father {
    var name:String = "";
  static var fname:String?
   private(set) var oRead:String?
    
    
    func setname(na:String) -> Void {
        name = na;
    }
  static  func fatherName(fn:String) -> Void {
    fname = fn;
    }

   class func otherName(n:String) -> Void {
        
    }
}
class Son:Father {
    
    
    //不可以重写
//    override static func fatherName(fn:String) -> Void {
//
//    }
    //可以重写
    override class func otherName(n: String) {
        
    }
}

extension Son {
//    var fullName:String = 扩展不可以添加存储属性。
// override  class func otherName(n:String) { 扩展不可以重写方法。
//    print("ex otherName")
//    }
    func fullName(n:String) {
        
    }
}

class XKeyWordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mson = Son();
        mson.setname(na: "haha")
        let father = Father();
        

    }

}

