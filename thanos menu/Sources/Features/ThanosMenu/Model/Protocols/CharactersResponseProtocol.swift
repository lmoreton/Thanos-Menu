//
//  CharactersResponseProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol CharactersResponseProtocol {
    var offset: Int { get }
    var limit: Int { get }
    var total: Int { get }
    var count: Int { get }
    var characters: [CharacterProtocol] { get }
}
