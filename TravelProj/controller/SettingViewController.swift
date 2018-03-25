//
//  SettingViewController.swift
//  TravelProj
//
//  Created by khaled omar on 2/15/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController , SWRevealViewControllerDelegate {
    
    lazy var menuBtn: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "menu-button-of-three-horizontal-lines")
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.clipsToBounds = true
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for:.touchUpInside)
        
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(menuBtn)
        
        handleMenuBtn()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
    
    func handleMenuBtn() {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        menuBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 32).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
