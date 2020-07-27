//
//  Thumbnail.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct Thumbnail: ThumbnailProtocol {
    let path: String
    let `extension`: String
    var fullPath: String {
        get {
            return path + "." + `extension`
        }
    }
}

extension Thumbnail: Decodable { }
