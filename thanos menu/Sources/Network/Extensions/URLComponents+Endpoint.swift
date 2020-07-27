//
//  URLComponents+Endpoint.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

extension URLComponents {
    init?(endpoint: EndpointProtocol) {
        self.init()
        scheme = endpoint.scheme
        host = endpoint.host
        path = endpoint.path

        guard let parameters = endpoint.parameters else {
            return
        }

        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
