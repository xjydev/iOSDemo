//
//  ExtensionViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/11.
//  Copyright © 2019 Xiaodev. All rights reserved.
//使用 extension 关键字声明扩展：

import UIKit

extension Double {
    var km:Double {
        return self * 1000.0;
    }
    func minus(m:Int) -> Double {
        return self-Double(m);
    }
}
class ExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "扩展"
        let d:Double = 11;
        print(d.km,d);
        let a = d.minus(m: 2);
        print(a);
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    deinit {
            
    }

}
class objectcl: NSObject {
    var pro = 0
}
extension objectcl {
    static var p = "proj"
//    var proj = 0;//扩展不能包含存储属性。可以添加新行为方法。
    var proj:Int {
        get {
            return objc_getAssociatedObject(self, &objectcl.p)as!Int;
        }
        set {
            objc_setAssociatedObject(self, &objectcl.p, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
        }
    }
}
