//
//  Details.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

final class Details: DetailsProtocol {
    var title: String? = nil
    var description: String? = nil
    var type: DetailsType? = nil
}

extension Details: Decodable {
    enum CodingKeys: String, CodingKey {
        case title, description
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String?.self, forKey: .title)
        description = try container.decode(String?.self, forKey: .description)
    }
}
