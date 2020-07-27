//
//  ThanosMenuViewModel.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class ThanosMenuViewModel: ThanosMenuViewModelProtocol {
    
    var dataFetcher: ThanosMenuDataFetcherProtocol
    var characters: [CharacterProtocol] = []
    var characterResponse: CharactersResponseProtocol?
    var view: ThanosMenuViewProtocol?
    var coordinator: ThanosMenuCoordinatorProtocol?
    var isLoading: Bool = false
    
    init(dataFetcher: ThanosMenuDataFetcherProtocol = ThanosMenuDataFetcher(), coordinator: ThanosMenuCoordinatorProtocol?) {
        self.coordinator = coordinator
        self.dataFetcher = dataFetcher
    }
    
    func fetchCharacters(limit: Int, offset: Int, nameStartingWith: String? = nil) {
        isLoading = true
        
        dataFetcher.fetchCharacters(limit: limit, offset: offset, nameStartingWith: nameStartingWith) { [weak self] result in
            
            switch result {
            case let .success(charactersResponseData):
                self?.updateCharacters(with: charactersResponseData.data)
            case let .failure(error):
                self?.view?.showError(error: error)
            }
            
            self?.isLoading = false
            self?.view?.stopLoading()
        }
    }
    
    func favoriteCharacter(_ character: CharacterProtocol) {
        FavoriteDataManager().setFavorite(to: true, for: character.id)
    }
    
    func didSelectCharacter(character: CharacterProtocol) {
        coordinator?.showCharacterDetails(character: character)
    }
    
    func updateCharacters(with response: CharactersResponseProtocol) {
        self.characters.append(contentsOf: response.characters)
        self.characterResponse = response
        
        view?.reloadDataSource()
    }
    
    func startTableLoading() {
        view?.startTableLoading()
    }
    
    func stopTableLoading() {
        view?.stopTableLoading()
    }
    
    func loadMore(with name: String? = nil) {
        guard let response = self.characterResponse else {
            view?.startLoading()
            fetchCharacters(limit: 20, offset: 0, nameStartingWith: name)
            return
        }
        
        let offset = response.offset + response.limit
        
        if offset < response.total && !isLoading {
            fetchCharacters(limit: response.limit, offset: offset, nameStartingWith: name)
        }
    }
    
    func fetchFirstCharacters() {
        cleanState()
        view?.startLoading()
        fetchCharacters(limit: 20, offset: 0, nameStartingWith: nil)
    }
    
    func cleanState() {
        characters = []
        characterResponse = nil
        view?.reloadDataSource()
    }
}
