//
//  Gigity.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

enum EndpointConfigs {
    case `default`
    
    var parameters: Parameters {
        switch self {
        case .default:
            let ts = Date().timeIntervalSince1970.description.replacingOccurrences(of: ".", with: "")

            let publicKey = EnvironmentSettings.apiPublicKey ?? ""
            let privateKey = EnvironmentSettings.apiPrivateKey ?? ""

            let hash = "\(ts)\(privateKey)\(publicKey)".md5
            
            return [
                "ts": ts,
                "apikey": publicKey,
                "hash": hash
            ]
        }
    }
    
    var path: String {
        switch self {
        case .default:
            return "/v1/public"
        }
    }
}
