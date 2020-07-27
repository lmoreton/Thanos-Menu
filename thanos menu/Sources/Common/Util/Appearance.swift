//
//  Appearance.swift
//  thanos menu
//
//  Created by Lucas Moreton on 19/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

final class Appearance: NSObject {
    private override init() { }
    
    static func configure(_ navigationBar: UINavigationBar) {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        navBarAppearance.backgroundColor = .systemBackground
        
        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
