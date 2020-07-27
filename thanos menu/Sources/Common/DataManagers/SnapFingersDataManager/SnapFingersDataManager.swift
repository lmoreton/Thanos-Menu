//
//  SnapFingersDataManager.swift
//  thanos menu
//
//  Created by Lucas Moreton on 24/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

struct SnapFingersDataManager: SnapFingersDataManagerProtocol {
    let kSnapFingersKey: String = "is-character-dead"
    
    func snapFingers(for characterId: Int) {
        UserDefaults.standard.set(true, forKey: "\(kSnapFingersKey)-\(characterId)")
    }
    
    func goBackInTime(for characterId: Int) {
        UserDefaults.standard.set(false, forKey: "\(kSnapFingersKey)-\(characterId)")
    }
    
    func isCharacterDead(_ characterId: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: "\(kSnapFingersKey)-\(characterId)")
    }
}
