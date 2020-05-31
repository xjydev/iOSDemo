//
//  EnumViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2019/7/9.
//  Copyright © 2019 Xiaodev. All rights reserved.
//

import UIKit
public let XDScreenHeight = UIScreen.main.bounds.height
public let XDScreenWidth = UIScreen.main.bounds.width

enum ArithmeticExpression {
    case number(Int)//枚举关联值
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case mutiplication(ArithmeticExpression,ArithmeticExpression)
}
enum viewtype {
    case first
    case second
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
//        bubbleSort()
        var list = [1,2,3,5,33,6,2,33,7,8,2];
        quickSort(list: &list, left: 0, right: list.count-1)
        print(list);
    }
    
    func bubbleSort() {//冒泡排序
        var list = [1,5,33,44,22]
//        for i in 0..<list.count {//找到符合条件的数进行交换
//            for j in i+1..<list.count {
//                print(i);
//                if list[j] > list[i] {
//                    let temp = list[j]
//                    list[j] = list[i]
//                    list[i] = temp
//                }
//            }
//        }
        for i in (0...list.count-2).reversed() {
            for j in (0...i) {
                if list[j]<list[j+1] {
                    let temp = list[j]
                    list[j] = list[j+1];
                    list[j+1] = temp
                }
            }
        }
        print(list)
    }
    func chooseSort() {//选择排序
        var list = [61,5,33,44,22]
        for i in 0..<list.count {
            var min = i//记录当前最小的数，比较i+1后更大的数进行记录
            for j in i+1..<list.count {
                if list[j] < list[min] {
                    min = j
                }
            }
            
            let temp = list[min]
            list[min] = list[i]
            list[i] = temp
        }
        
        print(list)
    }
    func quickSort(list: inout [Int], left: Int, right: Int) {
        if left >= right {//左边往右边移，右边往左边移动，最后过了就停止
            return
        }
        
        var i, j, pivot: Int
        
        i = left
        j = right
        pivot = list[left]
        
        while i < j {
            
            while list[j] <= pivot && i < j {//右边大的往左移动
                j -= 1
            }
            
            while list[i] >= pivot && i < j {//左边小的往右移动
                i += 1
            }
            
            if i < j {//找到两个对方区域的值进行交换
                let temp = list[i]
                list[i] = list[j]
                list[j] = temp
            }
        }
        
        list[left] = list[i]//此时i和j相等，处于中间位置，替换pivot值
        list[i] = pivot
        
        //重复以上动作
        quickSort(list: &list, left: left, right: i-1)
        quickSort(list: &list, left: i+1, right: right)
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
