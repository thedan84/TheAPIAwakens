//
//  StarWarsEntity.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

protocol StarWarsEntity: NetworkRequestable {
    var name: String { get }
    var url: URL { get }
    var films: [URL] { get }
}
