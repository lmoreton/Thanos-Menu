//
//  CharacterProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol CharacterProtocol {
    var id: Int { get }
    var name: String { get }
    var description: String? { get }
    var thumbnail: ThumbnailProtocol { get }
}
