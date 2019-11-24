//
//  Planet.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct Planet: StarWarsEntity {
    let name: String
    let url: URL
    let films: [URL]
    
    static let path = "planets"
}
