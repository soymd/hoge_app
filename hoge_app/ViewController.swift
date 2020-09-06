//
//  ViewController.swift
//  hoge_app
//
//  Created by soymd on 2020/09/06.
//  Copyright © 2020 soymd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height

        self.view.backgroundColor = UIColor.white
        let transitionBtn = UIButton()
        transitionBtn.frame = CGRect(
            x: viewWidth * 0.2,
            y: viewHeight * 0.4,
            width: viewWidth * 0.6,
            height: viewHeight * 0.2
        )
        
        transitionBtn.backgroundColor = UIColor.blue
        transitionBtn.addTarget(self, action: #selector(onTappedPush(_:)), for: .touchUpInside)
        self.view.addSubview(transitionBtn)
    }
    
    @objc func onTappedPush(_ sender: UIButton) {
        print(sender)
        let vc = SecondViewController()
        self.present(vc, animated: true, completion: nil)
    }

}

