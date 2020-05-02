//
//  SwiftBlocksViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//闭包捕获列表（closure capture list）

import UIKit
enum xjType {
    case first
    case second
}
class SwiftBlocksViewController: UIViewController {
    var label1: UILabel!
    
    var label2: UILabel!
    
    var blockd:BlokDemo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        let t:xjType = xjType.first
        
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
        let makeincre = makeIncrementer(forIncrement: 10);
        print(makeincre);
        print("----",makeincre);
        print("----",makeincre);
        
        blockd = BlokDemo(name: "123", text: "456")
        print(blockd!.asHTML())
        blockd!.asHTML = {
            return "890"
        }
        print(blockd!.asHTML())
        blockd?.funcBlock(s: "123", a: { (b) -> Void in
           print("bbbb ===",b)
        })
        
        blockd = nil
        print("============================")
        var heading:HTMLElement?
       heading = HTMLElement(name: "h2",text: "890")
        print(heading!.asHTML())
        let defaulT = "12345"
        heading!.asHTML = {
            print("blockh")
            return "<\(heading!.name)>\(heading!.text ?? defaulT)"
        }
        print(heading!.asHTML())
        
        heading!.changeText(text: "11111")
        print(heading!.asHTML())
//        heading = nil
        
        let p = person();
        p.fn = {
            print("p2")
            p.run();
        }
        print("p1");
        p.fn!();
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let other = XOtherViewController.init()
        other.blockFunc = { (a:Int) -> Int in//对传入值3进行处理，并返回值。
            NSLog("block back1 "+"\(a)")
            return a*a;
        }
        other.someFunctionWithEscapingClosure {
          print("escaping ========")
        }
        self.navigationController!.pushViewController(other, animated: true);
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

class BlokDemo {
    let name:String
    let text:String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            print("text == ")
            return "\(self.name)+\(text)"
        }
        else {
            print("name == ")
            return "\(self.name)"
        }
    }
    
    //尾随闭包
    func funcBlock(s:String, a:(_ b:Int)-> Void) {
        
        a(Int(s)!);
    }
    init(name:String,text:String? = nil) {
        self.name = name;
        self.text = text;
    }
    deinit {
        print("blockDemo deinit")
    }
}
class HTMLElement {
    
    let name: String
    var text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    func changeText(text:String) {
        self.text = text;
       let s = self.asHTML();
        print(s);
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
class person {
    var fn:(()->Void)?
    func run() {
        print("run")
    }
    deinit {
        print("deinit")
    }
}
