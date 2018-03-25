 //
//  SideMenuViewController.swift
//  TravelProj
//
//  Created by khaled omar on 2/15/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit


class SideMenuViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    var components = [UIImage(named: "home (1)") , UIImage(named: "settings (1)") , UIImage(named: "star (1)") , UIImage(named: "calendar")]
    
    var myIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = components [indexPath.row]
        let originalImage = components [indexPath.row]
        let editedImage = originalImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        cell.imageView?.image = editedImage
        cell.imageView?.tintColor = UIColor.white
        
        cell.imageView?.contentMode = .scaleAspectFit
        cell.backgroundColor = UIColor.clear
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if  components[indexPath.row] == components[0] {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "homeNavBar") as! UINavigationController
             self.revealViewController().pushFrontViewController(destination, animated: true)
            return
        
        }else if components[indexPath.row] == components[1] {
            let destination3 = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
            self.revealViewController().pushFrontViewController(destination3, animated: true)
            return
            
        }else if components[indexPath.row] == components[2] {
            let destination2 = self.storyboard?.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
            self.revealViewController().pushFrontViewController(destination2, animated: true)
            return
            
        }else if components[indexPath.row] == components[3] {
            let destination4 = self.storyboard?.instantiateViewController(withIdentifier: "AddPostViewController") as! AddPostViewController
            self.revealViewController().pushFrontViewController(destination4, animated: true)
            return
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

