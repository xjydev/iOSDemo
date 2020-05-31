//
//  InvokeOCViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/5/9.
//  Copyright © 2020 Xiaodev. All rights reserved.
//调用OC代码
//1.在iOSDemo-Bridging-Header.h里添加要引用的文件

import UIKit
@objcMembers//表示文件中成员可以被OC调用
class InvokeOCViewController: UIViewController {
   private  var privateVar = 0;
   public var publicVar = 1;
    var ivar = 2;
    func privateFunc(a:Int) -> Int {
        return a;
    }
    public func publicFunc(a:Int) -> Int {
        return a ;
    }
    func ocFunc(a:Int ,b:Int) -> Int {
        return a + b;
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = InvokeSwiftViewController.init()
        vc.num = 2
        self.navigationController?.pushViewController(vc, animated: true)
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
