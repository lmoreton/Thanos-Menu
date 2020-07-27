//
//  SnapFingersDataManagerProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 24/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol SnapFingersDataManagerProtocol {
    func snapFingers(for characterId: Int)
    func goBackInTime(for characterId: Int)
    func isCharacterDead(_ characterId: Int) -> Bool
}
