//
//  Endpoint+Defaults.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

extension EndpointProtocol {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return EnvironmentSettings.host ?? ""
    }
}
