//
//  UITableViewCell+Identifiable.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
