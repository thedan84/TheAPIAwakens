//
//  Person.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct Person: StarWarsEntity {
    let name: String
    let birthYear: String?
    let gender: String?
    let height: String
    let eyeColor: String
    let hairColor: String?
    let homeworld: URL?
    let skinColor: String?
    let url: URL
    let films: [URL]
    let mass: String
    let starships: [URL]?
    let vehicles: [URL]?
    let species: [URL]
    
    static let path = "people"
}
