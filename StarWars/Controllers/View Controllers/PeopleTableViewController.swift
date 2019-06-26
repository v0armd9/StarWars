//
//  PeopleTableViewController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let baseURL = PeopleController.sharedInstance.baseURL else {return}
        PeopleController.sharedInstance.fetchPeopleAt(url: baseURL) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PeopleController.sharedInstance.people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        let person = PeopleController.sharedInstance.people[indexPath.row]
        
        cell.textLabel?.text = person.name

        return cell
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destination as? PeopleDetailViewController
            let person = PeopleController.sharedInstance.people[indexPath.row]
            destinationVC?.person = person
        }
    }
}
