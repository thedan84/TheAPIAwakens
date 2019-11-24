//
//  PeopleController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct PeopleController {
    static func fetchHomePlanet(for person: Person, completion: @escaping (Result<Planet, Error>?) -> Void) {
        if let planetURL = person.homeworld {
            NetworkManager.fetch(url: planetURL) { result in
//                completion(result.flatMap { try JSONDecoder.starWarsDecoder.decode(Planet.self, from: $0) })
                completion(Result(catching: {
                    try JSONDecoder.starWarsDecoder.decode(Planet.self, from: result.get())
                }))
            }
        } else {
            completion(nil)
        }
    }
}
