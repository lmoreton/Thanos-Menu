//
//  ThanosMenuDataFetcher.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class ThanosMenuDataFetcher: ThanosMenuDataFetcherProtocol {
    func fetchCharacters(limit: Int, offset: Int, nameStartingWith: String? = nil, result: @escaping ResultHandler<CharactersResponseDataProtocol>) {
        let network = URLSessionProvider()
        
        let charactersEndpoint = CharactersEndpoint(limit: limit, offset: offset, nameStartingWith: nameStartingWith)
        
        let result: ResultHandler<CharactersResponseData> = { response in
            switch response {
            case let .success(charactersResponseData):
                result(.success(charactersResponseData))
            case let .failure(error):
                result(.failure(error))
            }
        }
        
        network.performRequest(endpoint: charactersEndpoint, result: result)
    }
}
