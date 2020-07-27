//
//  Coordinator.swift
//  thanos menu
//
//  Created by Lucas Moreton on 19/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
