//
//  People.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    
    let next: String
    let results: [PeopleDict]
    
}

struct PeopleDict: Decodable{
    let name: String
    let gender: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String

}
