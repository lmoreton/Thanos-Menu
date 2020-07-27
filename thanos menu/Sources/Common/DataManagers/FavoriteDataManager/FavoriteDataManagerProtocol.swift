//
//  FavoriteDataManagerProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 24/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol FavoriteDataManagerProtocol {
    func setFavorite(to bool: Bool, for characterId: Int)
    func isCharacterFavorite(_ characterId: Int) -> Bool
}
