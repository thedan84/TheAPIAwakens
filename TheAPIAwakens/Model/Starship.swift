//
//  Starship.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct Starship: StarWarsEntity {
    let cargoCapacity: String
    let consumables: String
    let costInCredits: String
    let crew: String
    let length: String
    let manufacturer: String
    let maxAtmospheringSpeed: String
    let model: String
    let name: String
    let passengers: String
    let pilots: [URL]
    let films: [URL]
    let url: URL
    let hyperdriveRating: String?
    let starshipClass: String?
    
    static let path = "starships"
}
