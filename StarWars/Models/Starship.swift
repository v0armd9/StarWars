//
//  Starship.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

struct StarshipTopLevelDict: Decodable {
    
    let next: String?
    let results: [StarshipDict]
}

struct StarshipDict: Decodable {
    let name: String
    let model: String
    let cost_in_credits: String
    let hyperdrive_rating: String
    let starship_class: String
    let crew: String
    let passengers: String
}
