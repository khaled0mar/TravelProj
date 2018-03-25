//
//  PostsViewController.swift
//  TravelProj
//
//  Created by khaled omar on 3/8/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    
    struct player {
        var name = String()
        var position = String()
    }
    
     var players =  [player(name: "tarek hamed", position: "midfield"),player(name: "mohamed ibrahem", position: "attack"), player(name: "elwensh", position: "defence"),player(name: "hazem emam", position: "defence")]
    
//    lazy var addButton: UIBarButtonItem = UIBarButtonItem(title: "search", style: .done, target: self, action: #selector(self.addTapped(sender:)))
    
    var filterPlayer = [player]()
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.rightBarButtonItem = self.addButton
        
        filterPlayer = players
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    @objc func addTapped(sender: AnyObject) {
        print("hjxdbsdhjbv")
        
        // Create the search controller and specify that it should present its results in this same view
        searchController = UISearchController(searchResultsController: nil)
        
        // Set any properties (in this case, don't hide the nav bar and don't show the emoji keyboard option)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.keyboardType = UIKeyboardType.asciiCapable
        
        // Make this class the delegate and present the search
//        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            filterPlayer = players
        }else{
            filterPlayer = players.filter({ $0.name.lowercased().contains(searchController.searchBar.text!.lowercased())})
        }
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterPlayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = self.filterPlayer[indexPath.row].name
        cell.detailTextLabel?.text = self.filterPlayer[indexPath.row].position
        
        return cell
        
    }

    

}
