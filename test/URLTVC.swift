//
//  URLTVC.swift
//  test
//
//  Created by Andrei Bazilchuk on 9/14/18.
//  Copyright © 2018 Andrei Bazilchuk. All rights reserved.
//

import UIKit

class URLTVC: UITableViewController {

    @IBOutlet var myUITableView: UITableView!
    
    let queryShared = queryURL.shared
    
    override func viewWillAppear(_ animated: Bool) {
        for item in queryShared.query {
            print("URL = \(item.myURLStrings)")
            print("Title = \(item.myURLtitle)")
            print("ResponseCode = \(item.statusCode)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myUITableView.delegate = self
//        myUITableView.dataSource = self
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queryShared.query.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = queryShared.query[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "URLCell") as! URLCell
        cell.setURL(urlClass: url)
        
        return cell
    }
    
}

//extension URLTVC: UITableViewDataSource, UITableViewDelegate{
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return queryShared.query.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let url = queryShared.query[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "URLCell") as! URLCell
//        cell.setURL(urlClass: url)
//
//        return cell
//    }
//}




