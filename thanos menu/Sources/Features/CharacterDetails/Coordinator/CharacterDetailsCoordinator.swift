//
//  CharacterDetailsCoordinator.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol CharacterDetailsCoordinatorProtocol: class {
    
}

class CharacterDetailsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewModel: CharacterDetailsViewModelProtocol?
    
    func start() {
        let viewModel = CharacterDetailsViewModel(coordinator: self)
        let characterDetailsViewController = CharacterDetailsViewController(viewModel: viewModel)
        viewModel.view = characterDetailsViewController
        self.viewModel = viewModel
        
        navigationController.pushViewController(characterDetailsViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension CharacterDetailsCoordinator: CharacterDetailsCoordinatorProtocol {
    
}

extension CharacterDetailsCoordinator: CharacterDetailsCoordinatorDelegate {
    func setupCharacter(_ character: CharacterProtocol) {
        viewModel?.character = character
    }
}
