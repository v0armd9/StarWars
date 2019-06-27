//
//  PlanetTableViewController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let baseURL = PlanetController.sharedInstance.baseURL else {return}
        PlanetController.sharedInstance.fetchPlanetAt(url: baseURL) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlanetController.sharedInstance.planets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        let planet = PlanetController.sharedInstance.planets[indexPath.row]
        cell.textLabel?.text = planet.name

        return cell
    }
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlanetDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destination as? PlanetDetailViewController
            let planet = PlanetController.sharedInstance.planets[indexPath.row]
            destinationVC?.planet = planet
        }

    }

}
