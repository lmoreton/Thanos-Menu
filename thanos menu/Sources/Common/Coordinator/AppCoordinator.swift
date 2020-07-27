//
//  AppCoordinator.swift
//  thanos menu
//
//  Created by Lucas Moreton on 19/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let thanosMenuCoordinator = ThanosMenuCoordinator(navigationController: navigationController)
        configure(navigationController: navigationController)
        
        thanosMenuCoordinator.start()
        childCoordinators.append(thanosMenuCoordinator)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func configure(navigationController: UINavigationController) {
        Appearance.configure(navigationController.navigationBar)
    }
}
