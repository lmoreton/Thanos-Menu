//
//  CharactersResponse.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct CharactersResponse: CharactersResponseProtocol {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let characters: [CharacterProtocol]
}

extension CharactersResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case offset, limit, total, count
        case characters = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        offset = try container.decode(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        total = try container.decode(Int.self, forKey: .total)
        count = try container.decode(Int.self, forKey: .count)
        characters = try container.decode([Character].self, forKey: .characters)
    }
}
