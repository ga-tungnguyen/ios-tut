//
//  SearchRepoTableViewController.swift
//  Github
//
//  Created by t_nguyen on 2017/07/31.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//

import UIKit

class SearchRepoTableViewController: UITableViewController {
    //lazy var searchBar: UISearchBar =

    @IBOutlet weak var searchBarRepo: UISearchBar? = UISearchBar(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 200, height: 200)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarRepo?.placeholder = "Search"
        let leftNarBarButton = UIBarButtonItem(customView: searchBarRepo!)
        self.navigationItem.leftBarButtonItem = leftNarBarButton
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
