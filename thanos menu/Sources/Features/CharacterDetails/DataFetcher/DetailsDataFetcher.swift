//
//  DetailsDataFetcher.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class DetailsDataFetcher: DetailsDataFetcherProtocol {
    func fetchComics(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>) {
        let network = URLSessionProvider()
        
        let comicsEndpoint = ComicsEndpoint(limit: limit, offset: offset, characterId: characterId)
        
        let result: ResultHandler<GenericDetailsResponseData> = { response in
            switch response {
            case let .success(detailsResponseData):
                result(.success(detailsResponseData))
            case let .failure(error):
                result(.failure(error))
            }
        }
        
        network.performRequest(endpoint: comicsEndpoint, result: result)
    }
    
    func fetchEvents(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>) {
        let network = URLSessionProvider()
        
        let eventsEndpoint = EventsEndpoint(limit: limit, offset: offset, characterId: characterId)
        
        let result: ResultHandler<GenericDetailsResponseData> = { response in
            switch response {
            case let .success(detailsResponseData):
                result(.success(detailsResponseData))
            case let .failure(error):
                result(.failure(error))
            }
        }
        
        network.performRequest(endpoint: eventsEndpoint, result: result)
    }
    
    func fetchSeries(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>) {
        let network = URLSessionProvider()
        
        let seriesEndpoint = SeriesEndpoint(limit: limit, offset: offset, characterId: characterId)
        
        let result: ResultHandler<GenericDetailsResponseData> = { response in
            switch response {
            case let .success(detailsResponseData):
                result(.success(detailsResponseData))
            case let .failure(error):
                result(.failure(error))
            }
        }
        
        network.performRequest(endpoint: seriesEndpoint, result: result)
    }
    
    func fetchStories(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<GenericDetailsResponseDataProtocol>) {
        let network = URLSessionProvider()
        
        let storiesEndpoint = StoriesEndpoint(limit: limit, offset: offset, characterId: characterId)
        
        let result: ResultHandler<GenericDetailsResponseData> = { response in
            switch response {
            case let .success(detailsResponseData):
                result(.success(detailsResponseData))
            case let .failure(error):
                result(.failure(error))
            }
        }
        
        network.performRequest(endpoint: storiesEndpoint, result: result)
    }
    
    func fetchAllDetails(limit: Int, offset: Int, characterId: Int, result: @escaping ResultHandler<DetailsResponseDataProtocol>) {
        var details: DetailsResponseDataProtocol = DetailsResponseData(details: [])
        
        fetchComics(limit: limit, offset: offset, characterId: characterId) { [unowned self] response in
            
            switch response {
            case let .success(comicsResponseData):
                let typedDetails: [DetailsProtocol] = comicsResponseData.data.details.map { comics in
                    comics.type = .comics
                    return comics
                }
                details.details.append(typedDetails)
            case let .failure(error):
                print(error)
            }
            
            self.fetchEvents(limit: limit, offset: offset, characterId: characterId) { [unowned self] response in
                
                switch response {
                case let .success(eventsResponseData):
                    let typedDetails: [DetailsProtocol] = eventsResponseData.data.details.map { comics in
                        comics.type = .events
                        return comics
                    }
                    details.details.append(typedDetails)
                case let .failure(error):
                    print(error)
                }
                
                self.fetchSeries(limit: limit, offset: offset, characterId: characterId) { [unowned self] response in
                    
                    switch response {
                    case let .success(seriesResponseData):
                        let typedDetails: [DetailsProtocol] = seriesResponseData.data.details.map { comics in
                            comics.type = .series
                            return comics
                        }
                        details.details.append(typedDetails)
                    case let .failure(error):
                        print(error)
                    }
                    
                    self.fetchStories(limit: limit, offset: offset, characterId: characterId) { response in
                        
                        switch response {
                        case let .success(storiesResponseData):
                            let typedDetails: [DetailsProtocol] = storiesResponseData.data.details.map { comics in
                                comics.type = .stories
                                return comics
                            }
                            details.details.append(typedDetails)
                        case let .failure(error):
                            print(error)
                        }
                        
                        result(.success(details))
                    }
                }
            }
        }
    }
}
