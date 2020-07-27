//
//  ViewCoding.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ViewCoding: class {
    
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCoding {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
