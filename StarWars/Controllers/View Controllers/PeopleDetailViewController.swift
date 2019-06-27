//
//  PeopleDetailViewController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: PeopleDict?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()

    }
    
    func updateLabels() {
        nameLabel.text = person?.name
        genderLabel.text = person?.gender
        heightLabel.text = person?.height
        massLabel.text = person?.mass
        hairColorLabel.text = person?.hair_color
        eyeColorLabel.text = person?.eye_color
        skinColorLabel.text = person?.skin_color
        birthYearLabel.text = person?.birth_year
    }

}
