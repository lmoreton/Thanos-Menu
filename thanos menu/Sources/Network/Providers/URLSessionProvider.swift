//
//  URLSessionProvider.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

final class URLSessionProvider: NetworkProviderProtocol, RequestHandleResponsable {
    private let session: URLSession

    init() {
        session = URLSession(configuration: URLSession.shared.configuration)
    }

    func performRequest<T: Decodable>(
        endpoint: EndpointProtocol,
        result: @escaping ResultHandler<T>
    ) {
        guard let request = URLRequest(endpoint: endpoint) else { preconditionFailure("Fail on create request") }

        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                let response = response as? HTTPURLResponse

                self.handleResponse(
                    data: data,
                    response: response,
                    error: error,
                    result: result
                )
            }
        }
        
        task.resume()
    }
}
