//
//  LottieViewController.swift
//  iOSDemo
//
//  Created by jingyuan5 on 2020/12/1.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

import UIKit
import Lottie
class LottieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func showLottie() {
        let path : String = Bundle.main.path(forResource: "thumb", ofType: "json")!
        let lottieAnimationView = AnimationView.init(filePath: path)
        lottieAnimationView.frame = CGRect(x: 100, y: 100, width: 50, height: 50);
        self.view .addSubview(lottieAnimationView);
        lottieAnimationView.backgroundColor = UIColor.red;
        lottieAnimationView.play();
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      showLottie()
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
