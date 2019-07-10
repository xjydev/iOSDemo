//
//  SwiftBlocksViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

import UIKit
enum xjType {
    case first
    case second
}
class SwiftBlocksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let t:xjType = xjType.first
        let names = ["f34","a123","b3","a1","f345"]
        let renames = names.sorted(by:backward);
        print(renames);
        let renames2 = names.sorted(by:<);
        print(renames2);
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let strings = numbers.map {(number) -> String in
            var number = number;
            var output = "";
            repeat {
                output = digitNames[number%10]!+output;
                number/=10;
            }while number > 0
            return output;
        }
        print(strings);
        print(makeIncrementer(forIncrement: 10));
        
    }
    func makeIncrementer(forIncrement amount:Int) -> Int {
        var runningTotal = 0;
        func incrementer() -> Int {
            runningTotal+=amount;
            return runningTotal;
        }
        return incrementer();
    }
    func backward(s1:String,s2:String) -> Bool {
        return s1>s2;
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
