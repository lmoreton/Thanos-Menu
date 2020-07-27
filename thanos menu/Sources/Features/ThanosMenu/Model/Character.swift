//
//  Hero.swift
//  thanos menu
//
//  Created by Lucas Moreton on 21/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct Character: CharacterProtocol {
    let id: Int
    let name: String
    let description: String?
    let thumbnail: ThumbnailProtocol
}

extension Character: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String?.self, forKey: .description)
        thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
    }
}
