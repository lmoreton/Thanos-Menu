//
//  DetailsResponse.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct DetailsResponse: DetailsResponseProtocol {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let details: [DetailsProtocol]
}

extension DetailsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case offset, limit, total, count
        case details = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        offset = try container.decode(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        total = try container.decode(Int.self, forKey: .total)
        count = try container.decode(Int.self, forKey: .count)
        details = try container.decode([Details].self, forKey: .details)
    }
}
