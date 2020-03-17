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
        bubbingSort(arr: &arr)
        print(arr);
        threeSum(arr: arr);
        

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
