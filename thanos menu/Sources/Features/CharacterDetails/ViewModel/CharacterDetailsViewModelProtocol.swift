//
//  CharacterDetailsViewModelProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol CharacterDetailsViewModelProtocol {
    var character: CharacterProtocol! { get set }
    var details: DetailsResponseDataProtocol { get set }
    var view: CharacterDetailsViewProtocol? { get set }
    func fetchDetails()
}
