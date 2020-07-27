//
//  CharactersEndpoint.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct CharactersEndpoint: EndpointProtocol {
    var path: String {
        return EndpointConfigs.default.path + "/characters"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: Header? {
        return nil
    }
    
    var parameters: Parameters? {
        var params = EndpointConfigs.default.parameters
        params["limit"] = limit
        params["offset"] = offset
        
        guard let name = nameStartingWith, !name.isEmpty else { return params }
        
        params["nameStartsWith"] = name

        return params
    }
    
    var body: Body? {
        return nil
    }
    
    let limit: Int
    let offset: Int
    let nameStartingWith: String?
}
