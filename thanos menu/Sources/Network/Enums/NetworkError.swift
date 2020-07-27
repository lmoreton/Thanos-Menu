//
//  NetworkError.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case custom(description: String)
    case unknown
    case parseError
    case noJSONData
    case noNetwork
    case requestTimeout
    case unauthorized
    case badRequest
    case outDated
    
    init(description: String) {
        self = .custom(description: description)
    }
}

extension NetworkError {
    func friendlyUserMessage() -> String {
        switch self {
        case let .custom(description):
            return description
        case .unknown, .parseError, .noJSONData, .badRequest, .outDated:
            return LocalizedString.notPossibleConnect.localized
        case .requestTimeout, .noNetwork:
            return LocalizedString.requestTimeOut.localized
        case .unauthorized:
            return LocalizedString.invalidInput.localized
        }
    }
}
