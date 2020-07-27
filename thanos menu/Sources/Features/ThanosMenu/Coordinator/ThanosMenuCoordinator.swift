//
//  ThanosMenuCoordinator.swift
//  thanos menu
//
//  Created by Lucas Moreton on 19/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol CharacterDetailsCoordinatorDelegate: class {
    func setupCharacter(_ character: CharacterProtocol)
}

protocol ThanosMenuCoordinatorProtocol: class {
    func showCharacterDetails(character: CharacterProtocol)
}

class ThanosMenuCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewModel: ThanosMenuViewModelProtocol?
    weak var delegate: CharacterDetailsCoordinatorDelegate?
    
    func start() {
        let viewModel = ThanosMenuViewModel(coordinator: self)
        let thanosMenuViewController = ThanosMenuViewController(viewModel: viewModel)
        viewModel.view = thanosMenuViewController
        self.viewModel = viewModel
        
        navigationController.viewControllers = [ thanosMenuViewController ]
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension ThanosMenuCoordinator: ThanosMenuCoordinatorProtocol {
    func showCharacterDetails(character: CharacterProtocol) {
        let characterDetailsCoordinator = CharacterDetailsCoordinator(navigationController: navigationController)
        delegate = characterDetailsCoordinator
        childCoordinators.append(characterDetailsCoordinator)
        characterDetailsCoordinator.start()
        
        delegate?.setupCharacter(character)
    }
}
