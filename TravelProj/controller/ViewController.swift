//
//  ViewController.swift
//  TravelProj
//
//  Created by khaled omar on 2/15/18.
//  Copyright © 2018 Mac. All rights reserved.
//



import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , SWRevealViewControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    
    lazy var menuBtn: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "menu-button-of-three-horizontal-lines")
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.clipsToBounds = true
       
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "home"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuBtn)
        self.tableView?.register(HomeCellTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = .none

        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.revealViewController().rearViewRevealWidth = 60 // self.view.frame.width-340
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

    }
    

     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId ) as! HomeCellTableViewCell
        return cell
        
    }
}
    
