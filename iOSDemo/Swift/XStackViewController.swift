//
//  XStackViewController.swift
//  iOSDemo
//
//  Created by XiaoDev on 2020/3/20.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit

class XStackViewController: UIViewController {
    
    let stackView = UIStackView(frame: CGRect.init(x: 0, y: 100, width: 300, height: 100));
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        stackView.axis = .horizontal;
        stackView.distribution = .fillEqually;
        stackView.alignment = .fill
        stackView.spacing = 10
        
        self.view.addSubview(stackView);
        
        for i in 0...3 {
            let btn = UIButton(type: .custom);
            btn.backgroundColor = UIColor.red;
            btn .setTitle("di"+" \(i)", for: .normal) ;
            
            btn.addTarget(self, action:#selector(self.buttonAction(btn:)) , for:.touchUpInside);
            btn.tag = 300+i;
            stackView.addArrangedSubview(btn);
        }
        print(KScreen.height());
        
        
    }
    @objc func buttonAction(btn:UIButton) {
        if btn.tag == 300 {
            btn.isHidden = !btn.isHidden;
        }
        else {
            stackView.removeArrangedSubview(btn);
        }
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let v = UIView();
        v.backgroundColor = UIColor.blue;
        stackView .addArrangedSubview(v);
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
