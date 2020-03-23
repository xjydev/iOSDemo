//
//  AlgorithmicViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

class AlgorithmicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var arr = [1,2,3,5,33,6,2,35,7,8,2];
        
//        quickSort(arr: &arr, left: 0, right: arr.count-1);
//        bubbingSort(arr: &arr)
//        selectSort(arr: &arr);
//        insertSort(arr: &arr);
        mergeSort(arr: &arr);
        print(arr);
        threeSum(arr: arr);
        
        let ma = maxCommonDivisor(a: 21, b: 24);
        print("max ",ma);
        let ind = halfLookfor(arr: arr, key: 6);
        print("half ",ind)
        
        let str = "hello world 3"
        let s = str.reversed()
        print("reversed" , s);
     let str1 = reverseStr(str: str);
        print("last" , str1 as Any);
        
    }
    //MARK:排序
    /// 快速排序
    /// - Parameters:
    func quickSort(arr:inout[Int],left:Int,right:Int) -> Void {
        if arr.count == 0 {
            return;
        }
        
        if left >= right {
            return ;
        }
       var i:Int = left
       var j:Int = right
       let p:Int = arr[left];
        while i < j {
            while arr[j] >= p && i < j{
                j-=1;
            }
            while arr[i] <= p && i < j{
                i+=1;
            }
            
            if i < j {
                let temp:Int = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        arr[left] = arr[i];
        arr[i] = p;
        quickSort(arr: &arr, left: left, right: i-1)
        quickSort(arr: &arr, left: i+1, right: right);
        return ;
    }
    //冒泡排序
    func bubbingSort(arr:inout [Int]) -> Void {
        if arr.count <= 1 {
            return;
        }
        for i in (1...arr.count-1).reversed() {
            for j in 0...i-1 {
                if arr[j] > arr[j+1] {
                    let temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
    }
    //选择排序
    func selectSort(arr:inout [Int]) -> Void {
        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                if arr[i] > arr[j] {
                    let temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
    }
    //插入排序
    func insertSort(arr:inout [Int]) -> Void {
        for i in 0..<arr.count {
            let temp = arr[i];
            for j in (0..<i).reversed(){
                if arr[j] >= temp {
                    arr[j+1] = arr[j];
                }
                else {
                    arr[j+1] = temp;
                    break;
                }
            }
        }
    }
    //归并排序
    func mergeSort(arr:inout [Int]) -> Void {
        if arr.count <= 1 {
            return;
        }
        mergeSort(arr: &arr, left: 0, right: arr.count-1);
    }
    func mergeSort(arr:inout [Int],left:Int,right:Int) -> Void {
        if left >= right {
            return;
        }
        let middle:Int = (left + right)/2;
        mergeSort(arr: &arr, left: left, right: middle);
        mergeSort(arr: &arr, left: middle+1, right: right);
        mergeSort(arr: &arr, left: left, right: right, middle: middle);
    }
    func mergeSort(arr:inout [Int],left:Int , right:Int , middle:Int) -> Void {
        var carr = [Int]();
        for a in left...right {
            carr.append(arr[a]);
        }
        var i:Int = left;
        var j:Int = middle+1;
        for k in left...right {
            if i > middle {
                arr[k] = carr[j - left];
                j+=1;
            }
            else if j>right {
                arr[k] = carr[i - left];
                i+=1;
            }
           else if carr[i - left] < carr[j - left] {
                arr[k] = carr[i - left];
                i+=1;
            }
            else {
                arr[k] = carr[j - left];
                j+=1;
            }
        }
        
        
    }
    //最大公约数
    func maxCommonDivisor(a:Int,b:Int) -> Int {
        
        var mina = b;
        var maxb = a;
        if a < b {
            mina = a;
            maxb = b;
        }
        var max = mina;
        //          for i in 1...mina {
        //              if a%i == 0 && b%i == 0 {
        //                  max = i;
        //              }
        //          }
        while maxb%mina > 0 {
            max = maxb%mina;
            maxb = mina;
            mina = max;
        }
        return max;
        
    }
    //折半查找
    func halfLookfor(arr:[Int],key:Int) -> Int {
        var min:Int = 0;
        var max:Int = arr.count - 1;
        var mid:Int;
        while min <= max {
            mid = (max + min)/2;
            if arr[mid] > key {
                max = mid - 1;
            }
            else if arr[mid] < key {
                min = mid + 1;
            }
            else {
                return mid;
            }
        }
        return -1;
    }
    //MARK:二叉树
    
    //MARK:链表
    
    //MARK:其他
    func threeSum(arr:[Int]) -> Void {
        
        for i in 0...arr.count-1 {
            let a = arr[i];
            if i+1<arr.count-1 && a == arr[i+1] {
                continue;
            }
            var start:Int = i+1;
            var end:Int = arr.count-1;
            while start < end {
                if arr[start] == arr[start+1] {
                    start += 1;
                }
                if arr[end] == arr[end-1] {
                    end = end-1;
                }
                let b = a + arr[start] + arr[end];
                
                if b > 40 {
                    end -= 1;
                }
                else if b < 40 {
                    start += 1;
                }
                else {
                    print(a,arr[start],arr[end]);
                    end -= 1;
                }
            }
        }
        
    }
    //MARK:字符串反转
    func reverseStr(str:String?) -> String? {
        if str == nil {
            return nil;
        }
        var str1 = str!;
//        var i = 0;
//        var j = str1.count - 1;
//
//        while i<j {
//            let temp = str1.in;
//            arr[i] = arr[j];
//            arr[j] = temp;
//            i+=1;
//            j-=1;
//        }
//        print(arr);
//        let str1 = String.init(cString: arr, encoding: .utf8);
//        print(str1!)
        return str1;
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
