//
//  NetworkProviderProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void

protocol NetworkProviderProtocol {
    func performRequest<T: Decodable>(endpoint: EndpointProtocol, result: @escaping ResultHandler<T>)
}
