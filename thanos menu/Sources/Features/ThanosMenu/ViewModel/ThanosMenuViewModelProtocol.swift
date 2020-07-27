//
//  ThanosMenuViewModelProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ThanosMenuViewModelProtocol {
    var characters: [CharacterProtocol] { get set }
    var characterResponse: CharactersResponseProtocol? { get set }
    var view: ThanosMenuViewProtocol? { get set }
    func fetchCharacters(limit: Int, offset: Int, nameStartingWith: String?)
    func fetchFirstCharacters()
    func updateCharacters(with response: CharactersResponseProtocol)
    func favoriteCharacter(_ character: CharacterProtocol)
    func didSelectCharacter(character: CharacterProtocol)
    func loadMore(with name: String?)
    func startTableLoading()
    func stopTableLoading()
    func cleanState()
}
