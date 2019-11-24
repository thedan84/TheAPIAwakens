//
//  Pageable.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

protocol Pageable: Codable {
    associatedtype Entity: StarWarsEntity
    var next: URL? { get }
    var previous: URL? { get }
    var count: Int { get }
    var results: [Entity] { get }
}
