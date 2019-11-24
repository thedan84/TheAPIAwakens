//
//  EntityController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct EntityController<T: StarWarsEntity> {
    private static func fetch(url: URL, completion: @escaping (Result<PagedResponse<T>, Error>) -> Void) {
        NetworkManager.fetch(url: url) { result in
//            completion(result.flatMap { try JSONDecoder.starWarsDecoder.decode(PagedResponse<T>.self, from: $0) })
            completion(Result {
                try JSONDecoder.starWarsDecoder.decode(PagedResponse<T>.self, from: result.get())
            })
        }
    }
    
    static func fetch(page: Int, completion: @escaping (Result<[T], Error>) -> Void) {
        guard let url = T.endpoint(page: page) else { return }
        fetch(url: url, completion: { completion($0.map { $0.results })})
    }
    
    static func fetchAll(completion: @escaping (Result<[T], Error>) -> Void) {
        var arrayToReturn = [T]()
        func handle(result: Result<PagedResponse<T>, Error>) {
            do {
                let response = try result.get()
                arrayToReturn.append(contentsOf: response.results)
                if let nextURL = response.next {
                    fetch(url: nextURL, completion: handle)
                } else {
                    completion(.success(arrayToReturn))
                }
            } catch {
                completion(.failure(error))
            }
        }
        guard let url = T.endpoint(page: 1) else { return }
        fetch(url: url, completion: handle)
    }
}
