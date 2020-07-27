//
//  DetailsProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

enum DetailsType: String {
    case comics, events, series, stories
}

protocol DetailsProtocol: class {
    var title: String? { get }
    var description: String? { get }
    var type: DetailsType? { get set }
}
