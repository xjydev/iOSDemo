//
//  EnumViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

import UIKit

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case mutiplication(ArithmeticExpression,ArithmeticExpression)
}
func evaluate(_ expression:ArithmeticExpression) ->Int {
    switch expression {
    case let .number(a):
        return a
    case let .addition(a , b):
        return evaluate(a)+evaluate(b)
    case let .mutiplication(a, b):
        return evaluate(a)*evaluate(b)
    }
}
class EnumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      let a = ArithmeticExpression.number(4);
        let d = ArithmeticExpression.number(5);
        
      let b = ArithmeticExpression.addition(a, d);
      let c = ArithmeticExpression.mutiplication(a, d);
        print(a,b,evaluate(c));
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
