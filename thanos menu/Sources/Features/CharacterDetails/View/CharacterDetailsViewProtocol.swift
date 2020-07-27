//
//  CharacterDetailsViewProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol CharacterDetailsViewProtocol {
    func reloadDataSource()
    func showError(error: Error)
    func startLoading()
    func stopLoading()
}
