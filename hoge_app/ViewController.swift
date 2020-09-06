//
//  ViewController.swift
//  hoge_app
//
//  Created by soymd on 2020/09/06.
//  Copyright © 2020 soymd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countText : UITextView = UITextView()
    var count:Int = 1
    
   
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
        
        
        let doubleUpBtn = UIButton()
        doubleUpBtn.frame = CGRect(
            x: viewWidth * 0.1,
            y: viewHeight * 0.1,
            width: viewWidth * 0.2,
            height: viewHeight * 0.1
        )
        doubleUpBtn.backgroundColor = UIColor.yellow
        doubleUpBtn.addTarget(self, action: #selector(tappedDoubleUp(_:)), for: .touchUpInside)
        
        countText = UITextView()
        countText.text = String(count)
        countText.frame = CGRect(
            x: viewWidth * 0.5,
            y: viewHeight * 0.5,
            width: viewWidth * 0.3,
            height: viewHeight * 0.1
        )
        
        
        self.view.addSubview(transitionBtn)
        self.view.addSubview(doubleUpBtn)
        self.view.addSubview(countText)
    }
    
    @objc func onTappedPush(_ sender: UIButton) {
        print(sender)
        let vc = SecondViewController()
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        print(self.navigationController)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedDoubleUp(_ sender:UIButton) {
        count = count * 2
        countText.text = String(count)
    }

}
