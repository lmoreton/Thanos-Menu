//
//  ThanosMenuViewProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ThanosMenuViewProtocol {
    func reloadDataSource()
    func showError(error: Error)
    func startLoading()
    func stopLoading()
    func startTableLoading()
    func stopTableLoading()
}
