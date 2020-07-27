//
//  Array+Coordinator.swift
//  thanos menu
//
//  Created by Lucas Moreton on 27/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

extension Array where Element == Coordinator {
    mutating func remove<T: Coordinator>(coordinator: T.Type) {
        if let i = self.firstIndex(where: {$0 is T}) {
            remove(at: i)
        }
    }
    
    mutating func remove<T: Coordinator>(_ coordinator: T) {
        if let i = self.firstIndex(where: { $0 === coordinator }) {
            remove(at: i)
        }
    }
}
