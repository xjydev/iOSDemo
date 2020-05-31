//
//  DataTypeViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/21.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit
struct DataStruct {
    static func returnDataLog() {
        print("struct log");
    }
}
class DataTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        DataStruct.returnDataLog();
        stringFunc();
        gatherFun();
        // Do any additional setup after loading the view.
    }
    //MARK:字符串
    func stringFunc() {
        
    }
    //MARK:集合
    func gatherFun() {
//        String
//        NSString
//        Array
        
        var arr = [Int]();//初始化数组
        arr.append(1);//添加内容
        print(arr);
        let arr1 = Array(repeating: 4, count: 2);
        print(arr1);
        let arr2 = arr + arr1;//两数组相加
        print(arr2);
        var arr3 = ["2","3"];
        arr3.append("4");
        arr3.insert("1", at: 0);
        for item in arr3 {
            print(item);
        }
        for (index,value) in arr3.enumerated() {//每个数据项的值和索引值
            print(index,value);
        }
        
        let arr4 = [1,2,3,4,5,6,7,0,8];
        let arr5 = arr4.filter { (item) -> Bool in//过滤
            item > 5;
        }
        print(arr5);
        
        let arr6 = arr4.map { (item) -> Int in
            return item+10;
        }
        print(arr6 ,"\n",arr4);
        var total = 0;
        let num = arr4.reduce(total) {(item, n) -> Int in
            print(item,"===",n)
            total = total + n;
            return total;
        }
         print(num);
        let arr7 =  arr4.compactMap { (item) -> Int? in
            print(item);
            return item ;
        }
        print(arr7);
       
        
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
