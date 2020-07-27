//
//  CharacterDetailsViewModel.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
    var dataFetcher: DetailsDataFetcherProtocol
    var character: CharacterProtocol!
    var details: DetailsResponseDataProtocol = DetailsResponseData(details: [])
    var view: CharacterDetailsViewProtocol?
    var coordinator: CharacterDetailsCoordinatorProtocol?
    var isLoading: Bool = false
    
    init(dataFetcher: DetailsDataFetcherProtocol = DetailsDataFetcher(), coordinator: CharacterDetailsCoordinatorProtocol?) {
        self.coordinator = coordinator
        self.dataFetcher = dataFetcher
    }
    
    func fetchDetails() {
        view?.startLoading()
        isLoading = true
        
        dataFetcher.fetchAllDetails(limit: 3, offset: 0, characterId: character.id) { [weak self] result in
            
            switch result {
            case let .success(detailsResponseData):
                print(detailsResponseData)
                self?.details = detailsResponseData
                self?.view?.reloadDataSource()
            case let .failure(error):
                self?.view?.showError(error: error)
            }
            
            self?.isLoading = false
            self?.view?.stopLoading()
        }
    }
}
