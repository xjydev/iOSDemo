//
//  XJYViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/15.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

class XJYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func find(target:Int,in array:[Int]) -> Int {
        if (array.count == 0){
            return -1;
        }
//        for i in 0..<array.count {
//            if array[i] == target {
//                return i;
//            }
//        }
        var left:Int = 0;
        var right:Int = array.count-1;
        while left < right {
            let mid = left + (right - left)/2;
             if (array[mid] == target) {
                 return mid
             }
            else if (array[mid] > target) {
                right = mid;
             }
             else {
                left = mid;
             }
        }
        
        return -1;
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
