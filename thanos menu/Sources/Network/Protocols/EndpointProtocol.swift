//
//  EndpointProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

typealias Header = [String: String]
typealias Parameters = [String: Any]
typealias Body = [String: Any]

protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: Header? { get }
    var parameters: Parameters? { get }
    var body: Body? { get }
}
