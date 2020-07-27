//
//  FavoriteDataManager.swift
//  thanos menu
//
//  Created by Lucas Moreton on 24/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct FavoriteDataManager: FavoriteDataManagerProtocol {
    let kFavoriteKey: String = "is-character-favorite"
    
    func setFavorite(to bool: Bool, for characterId: Int) {
        UserDefaults.standard.set(bool, forKey: "\(kFavoriteKey)-\(characterId)")
    }
    
    func isCharacterFavorite(_ characterId: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: "\(kFavoriteKey)-\(characterId)")
    }
}
