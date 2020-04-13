//
//  AlgorithmicViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit
public class ListNode {
    var next:ListNode?
    var value:Int = 0
}
public class TreeNode {
    var left:TreeNode?;
    var right:TreeNode?;
    var value:Int = 0;
}

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
        
        let twosum = twoSum([3,2,4], 6);
        print(twosum);
        let arr2 = [-1,0,1,2,-1,-4,0,0,0];
        print(threeSum2(arr2))
        print(max69Num(num: 69699));
        
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
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
          var dict = Dictionary<Int,Int>()
          for i in 0..<nums.count{
              dict[nums[i]] = i;
          }
          for i in 0..<nums.count {
              let a = target - nums[i];
            print(a,dict)
              if let b = dict[a] {
                if b != i {
                  return [i,b]
                }
              }
          }
          return []
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
  //三数之和
    func threeSum2(_ nums: [Int]) -> [[Int]] {
       var results = [[Int]]()
        let numarr = nums.sorted()
        
        print(numarr)
         for i in 0..<numarr.count {
            
            if i > 0 && numarr[i] == numarr[i-1] {
                continue;
            }
            
            
             let a = numarr[i];
             var left:Int = i+1;
             var right:Int = numarr.count-1;
             while (left < right){
                let t = numarr[left]+numarr[right];
                 print(left,right)
               if t == -a {
                    results.append([numarr[i],numarr[left],numarr[right]])
                   while left < right && numarr[left] == numarr[left + 1] {
                       left += 1;
                   }
                   while left < right && numarr[right] == numarr[right - 1] {
                       right -= 1;
                   }
                   left += 1;
                   right -= 1;
                }
                else if t > -a {
                     right -= 1;
                 }
                 else {
                     left += 1;
                 } 
             }
         }
         return results;
    }
    func sort(nums:inout [Int],left:Int,right:Int){
        if nums.count == 0 {
          return;
        }
        if left >= right {
           return;
        }
        var i = left;
        var j = right;
        let key = nums[left];
        while(i < j){
            while (nums[j] >= key && i < j) {
                j-=1;
            }
            while (nums[i] <= key && i < j ){
                i+=1;
            }
             let temp = nums[i];
             nums[i] = nums[j];
             nums[j] = temp;
        }

        nums[left] = nums[i];
        nums[i] = key;
        sort(nums: &nums,left: left,right: i-1);
        sort(nums: &nums,left: i+1,right: right);
    }
    //MARK:链表
    //删除节点。
    func deleteNode(node:ListNode?) -> Bool {
        guard let newNode = node else {
            return false;
        }
        guard let nextNode = newNode.next else {
            return false;
        }
        newNode.value = nextNode.value;
        newNode.next = nextNode.next;
        return true;
    }
    func max69Num(num:Int) -> Int {
//        var newnum:Int = num;
//        var count:Int = 0;
//        var last:Int = 0;
//        while (newnum > 0) {
//            if(newnum%10 == 6){
//                last = count;
//            }
//            newnum = newnum/10;
//            count += 1;
//        }
//        let b = pow(10, last);
//        let a = num + (3 * (Int(truncatingIfNeeded:b) ?? 0));
//        return a;
        return 0 ;
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
