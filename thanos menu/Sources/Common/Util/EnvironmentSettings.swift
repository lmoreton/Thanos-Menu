//
//  EnvironmentSettings.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

enum EnvironmentSettings {
    static var environment: [String: AnyObject]? {
        return Bundle.main.infoDictionary?["EnvironmentSettings"] as? [String: AnyObject]
    }
    
    static var host: String? {
        return environment?["HOST"] as? String
    }
    
    static var apiPrivateKey: String? {
        return environment?["API_PRIVATE_KEY"] as? String
    }
    
    static var apiPublicKey: String? {
        return environment?["API_PUBLIC_KEY"] as? String
    }
}
