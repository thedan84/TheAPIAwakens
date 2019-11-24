//
//  NetworkManager.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct NetworkManager {
    private static let session = URLSession(configuration: .default)
    
    static func fetch(endpoint: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        fetch(url: endpoint, completion: completion)
    }
    
    static func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        
        task.resume()
    }
}
