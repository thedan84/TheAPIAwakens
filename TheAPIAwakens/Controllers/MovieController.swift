//
//  MovieController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct MovieController {
    static func fetchMovies(for entity: StarWarsEntity, completion: @escaping (Result<[Film], Error>) -> Void) {
        let group = DispatchGroup()
        var results = [Result<Film, Error>]()
        for url in entity.films {
            group.enter()
            NetworkManager.fetch(url: url) { result in
//                results.append(result.flatMap { try JSONDecoder.starWarsDecoder.decode(Film.self, from: $0) })
                results.append(Result(catching: {
                    try JSONDecoder.starWarsDecoder.decode(Film.self, from: result.get())
                }))
                group.leave()
            }
        }
        
        group.notify(queue: .global()) {
            completion(Result { try results.map { try $0.get() } })
        }
    }
}
