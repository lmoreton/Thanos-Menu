//
//  ThumbnailProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ThumbnailProtocol {
    var path: String { get }
    var `extension`: String { get }
    var fullPath: String { get }
}
