//
//  PeopleController.swift
//  StarWars
//
//  Created by Darin Marcus Armstrong on 6/26/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class PeopleController {
    
    static let sharedInstance = PeopleController()
    
    var people: [PeopleDict] = []
    let baseURL = URL(string: "https://swapi.co/api/people")
    
    func fetchPeopleAt(url: URL, completion: @escaping() -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error{
                print(error)
                completion(); return
            }
            guard let data = data else {return}
            guard let peopleData = try? JSONDecoder().decode(TopLevelDict.self, from: data) else {completion(); return}
            self.people.append(contentsOf: peopleData.results)
            if let nextString = peopleData.next, let nextURL = URL(string: nextString) {
                self.fetchPeopleAt(url: nextURL, completion: completion)
            } else {
                completion()
            }
        }.resume()
    }
    
    
}//End of Class
