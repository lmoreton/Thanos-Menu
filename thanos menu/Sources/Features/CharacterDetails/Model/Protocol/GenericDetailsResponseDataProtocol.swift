//
//  DetailsResponseDataProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol GenericDetailsResponseDataProtocol {
    var code: Int { get }
    var status: String { get }
    var copyright: String { get }
    var data: DetailsResponseProtocol { get }
}
