//
//  Planet.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

struct PlanetTopLevelDict: Decodable {
    
    let next: String?
    let results: [PlanetDict]
    
}

struct PlanetDict: Decodable{
    let name: String
    let climate: String
    let terrain: String
    let diameter: String
    let gravity: String
    let population: String
}
