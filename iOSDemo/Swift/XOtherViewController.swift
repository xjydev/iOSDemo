//
//  XOtherViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/20.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

class XOtherViewController: UIViewController {
    func someFunc(closure:(_ a:Int)->Void) {//尾随闭包
        
    }
//    var completionHandler: ()->Void;
    public var completi:(()->Void)?
    func someFunctionWithEscapingClosure(completionHanler: @escaping () ->Void){
        self.completi = completionHanler;
    }
    public var blockFunc:((_ a:Int)->Int)!//闭包;
    
    let buttonClick = {
        print("buttonclck");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        // 以下是不使用尾随闭包进行函数调用
        
        // 以下是使用尾随闭包进行函数调用
       
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 100, width: 100, height: 100);
        btn.backgroundColor = UIColor.red;
        btn.addTarget(self, action: #selector(buttonAction(btn:)), for: .touchUpInside);
        self.view.addSubview(btn);
        
    }
    @objc func buttonAction(btn:UIButton){
      let p = self.blockFunc(3);//调用，传值3，接受返回值。
        print(p);
        self.completi?()
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
