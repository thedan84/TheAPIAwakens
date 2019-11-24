//
//  VehicleController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct VehicleController<T: StarWarsEntity> {
    static func fetchVehicles(for person: Person, completion: @escaping (Result<[T], Error>?) -> Void) {
        let urls = T.self == Vehicle.self ? person.vehicles : person.starships
        
        if let urls = urls {
            var vehiclesToReturn = [Result<T, Error>]()
            let group = DispatchGroup()
            for url in urls {
                group.enter()
                NetworkManager.fetch(url: url) { result in
                    vehiclesToReturn.append(Result(catching: {
                        try JSONDecoder.starWarsDecoder.decode(T.self, from: result.get())
                    }))
                    
//                    vehiclesToReturn.append(result.flatMap { try JSONDecoder.starWarsDecoder.decode(T.self, from: $0) })
                    
                    vehiclesToReturn.append(Result { try JSONDecoder.starWarsDecoder.decode(T.self, from: result.get()) })
                    group.leave()
                }
            }
            
            group.notify(queue: .global()) {
                completion(Result { try vehiclesToReturn.map { try $0.get() } })
            }
        } else {
            completion(nil)
        }
    }
}
