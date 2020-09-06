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
        self.title = "first view"
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height

        self.view.backgroundColor = UIColor.gray
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
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        print(self.navigationController)
        self.navigationController?.pushViewController(vc, animated: false)
    }

}

