//
//  PlanetDetailViewController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    
    var planet: PlanetDict?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        nameLabel.text = planet?.name
        climateLabel.text = planet?.climate
        terrainLabel.text = planet?.terrain
        diameterLabel.text = planet?.diameter
        gravityLabel.text = planet?.gravity
        populationLabel.text = planet?.population
        
    }
 
}
