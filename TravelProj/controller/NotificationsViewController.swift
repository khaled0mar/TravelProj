//
//  NotificationsViewController.swift
//  TravelProj
//
//  Created by khaled omar on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    let cell = NotificationsTableViewCell()
    
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
        
        self.tableView?.register(NotificationsTableViewCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(menuBtn)
        
        handleMenuBtn()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleMenuBtn() {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        menuBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 32).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId ) as! NotificationsTableViewCell
        if indexPath.row % 2 == 0 {
            handelFollowButtonCostraint(cell: cell, flag: false)
        }else{
            handelFollowButtonCostraint(cell: cell, flag: true)
        }
        
        return cell
    }
    
    func  handelFollowButtonCostraint( cell: NotificationsTableViewCell ,flag: Bool) {
        if flag {
            cell.notificationRightAnchorOnly?.isActive = true
            cell.notificationRightAnchorWithFollowButton?.isActive = false
            cell.followButton.isHidden = true
        }else{
            cell.notificationRightAnchorWithFollowButton?.isActive = true
            cell.notificationRightAnchorOnly?.isActive = false
        }
    }
    
    
    

}
