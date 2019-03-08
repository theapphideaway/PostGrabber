//
//  ViewController.swift
//  SprintJSON
//
//  Created by Ian Schoenrock on 3/7/19.
//  Copyright © 2019 Ian Schoenrock. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    static let api = WebAPI()
    var myPosts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.api.getTestAPI { (posts) in
            self.myPosts = posts
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = myPosts[indexPath.row].title
        
        return cell
    }
}

