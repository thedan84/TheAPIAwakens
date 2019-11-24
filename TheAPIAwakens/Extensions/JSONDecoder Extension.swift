//
//  JSONHandler.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24-11-19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var starWarsDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
