//
//  XStringViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/4/16.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

class XStringViewController: UIViewController {
    let label:UILabel = UILabel.init(frame: CGRect(x: 20, y: 120, width: 200, height:180));
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        label.backgroundColor = UIColor.gray;
        label.numberOfLines = 0
        self.view.addSubview(label);
        var str = """
        hello word In a \""" storyboard-based application, you will\
        often want to do a little preparation before navigation
        """
        str += "123"
        let num = 456
        str += "\(num)"
        
        var lstr:String = "123456789"
        for ch:Character in lstr {
            print(ch);
        }
        //字符串反转
        var swap = 0;
        var chars:[Character] = Array(lstr);//获取character数组。
        while swap < lstr.count/2 {
            chars.swapAt(swap,lstr.count - swap - 1);
            swap += 1;
        }
        lstr = String(chars)
        //间隔两位插入，
        var off = -2;
        while off >= -(lstr.count - 1) {
          lstr.insert(",", at: lstr.index(lstr.endIndex, offsetBy: off));
            off += -3;
        }
        
        var nstr = "hello ,$word"
        let index = nstr.firstIndex(of: "$") ?? nstr.endIndex
        let ns = nstr[..<index];
//        lstr.insert("0", at: lstr.index(lstr.endIndex, offsetBy: -7));
        str += lstr;
        str += ns
//        str.swpAt
        label.text = str;
        
        
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
