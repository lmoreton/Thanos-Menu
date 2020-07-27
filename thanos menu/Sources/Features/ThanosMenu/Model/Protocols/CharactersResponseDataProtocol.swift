//
//  CharactersResponseDataProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol CharactersResponseDataProtocol {
    var code: Int { get }
    var status: String { get }
    var copyright: String { get }
    var data: CharactersResponseProtocol { get }
}
