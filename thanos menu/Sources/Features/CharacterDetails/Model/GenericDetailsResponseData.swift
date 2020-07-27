//
//  DetailsResponseData.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct GenericDetailsResponseData: GenericDetailsResponseDataProtocol {
    let code: Int
    let status: String
    let copyright: String
    let data: DetailsResponseProtocol
}

extension GenericDetailsResponseData: Decodable {
    enum CodingKeys: String, CodingKey {
        case code, status, copyright, data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        status = try container.decode(String.self, forKey: .status)
        copyright = try container.decode(String.self, forKey: .copyright)
        data = try container.decode(DetailsResponse.self, forKey: .data)
    }
}
