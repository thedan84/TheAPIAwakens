//
//  NetworkRequestable.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

protocol NetworkRequestable: Codable {
    static var path: String { get }
    
    static func endpoint(page: Int) -> URL?
}

extension NetworkRequestable {
    static var baseURL: URL? {
        return URL(string: "https://swapi.co/api/")
    }

    static func endpoint(page: Int) -> URL? {
        guard let url = baseURL else { return nil }
        var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        return components?.url
    }
}
