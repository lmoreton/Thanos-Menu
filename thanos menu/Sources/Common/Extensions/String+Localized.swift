//
//  String+Localized.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

extension String {
    func localized(_ comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}
