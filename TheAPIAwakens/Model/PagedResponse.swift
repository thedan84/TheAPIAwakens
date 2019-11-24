//
//  PagedResponse.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import Foundation

struct PagedResponse<T: StarWarsEntity>: Pageable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [T]
}
