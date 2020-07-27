//
//  CharacterDetailsDataFetcherProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol DetailsDataFetcherProtocol {
    func fetchComics(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>)
    func fetchEvents(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>)
    func fetchSeries(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>)
    func fetchStories(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>)
    func fetchAllDetails(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<DetailsResponseDataProtocol>)
}
