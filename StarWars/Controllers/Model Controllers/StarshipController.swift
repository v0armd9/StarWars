//
//  StarshipController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

class StarshipController {
    
    static let sharedInstance = StarshipController()
    
    var starships: [StarshipDict] = []
    let baseURL = URL(string: "https://swapi.co/api/starships")
    
    func fetchStarshipsAt(url: URL, completion: @escaping() -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                completion(); return
            }
            guard let data = data else {return}
            guard let starshipData = try? JSONDecoder().decode(StarshipTopLevelDict.self, from: data) else {completion(); return}
            self.starships.append(contentsOf: starshipData.results)
            if let nextString = starshipData.next, let nextURL = URL(string: nextString) {
                self.fetchStarshipsAt(url: nextURL, completion: completion)
            } else {
                completion()
            }
        }.resume()
    }
}
