//
//  StoriesEndpoint.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct StoriesEndpoint: EndpointProtocol {
    var path: String {
        return EndpointConfigs.default.path + "/characters/\(characterId)/stories"
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

        return params
    }
    
    var body: Body? {
        return nil
    }
    
    let limit: Int
    let offset: Int
    let characterId: Int
}
