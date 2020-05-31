//
//  OCObject.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/9.
//  Copyright © 2020 Xiaodev. All rights reserved.
//@objc 提供OC调用的变量和方法。

import UIKit

class OCObject: NSObject {
    @objc var name = "ocobject"
    var iName = "iName"
    @objc func objectFunc(a:Int,b:Int)->Int {
        print("\(#function) in \(#file)")
        return a + b;
    }
    func ifunc (a:Int ) -> Int {
        print("\(#function) in \(#file)")
        return a;
    }
}
