//
//  ThanosMenuDataFetcherProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ThanosMenuDataFetcherProtocol {
    func fetchCharacters(limit: Int, offset: Int, nameStartingWith: String?, result: @escaping ResultHandler<CharactersResponseDataProtocol>)
}
