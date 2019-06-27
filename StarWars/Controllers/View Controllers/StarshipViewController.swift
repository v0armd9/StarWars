//
//  StarshipViewController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class StarshipViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var hyperdriveLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    
    var starship: StarshipDict?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()

    }
    
    
    func updateLabels() {
        nameLabel.text = starship?.name
        modelLabel.text = starship?.model
        costLabel.text = starship?.cost_in_credits
        hyperdriveLabel.text = starship?.hyperdrive_rating
        classLabel.text = starship?.starship_class
        crewLabel.text = starship?.crew
        passengerLabel.text = starship?.passengers
    }
    
}
