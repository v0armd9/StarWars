//
//  PlanetController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

class PlanetController {
    
    static let sharedInstance = PlanetController()
    
    var planets: [PlanetDict] = []
    let baseURL = URL(string: "https://swapi.co/api/planets")
    
    func fetchPlanetAt(url: URL, completion: @escaping () -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                completion(); return
            }
            guard let data = data else {return}
            guard let planetData = try? JSONDecoder().decode(PlanetTopLevelDict.self, from: data) else {completion(); return}
            self.planets.append(contentsOf: planetData.results)
            if let nextString = planetData.next, let nextURL = URL(string: nextString) {
                self.fetchPlanetAt(url: nextURL, completion: completion)
            } else {
                completion()
            }
        }.resume()
    }
} //End of Class
