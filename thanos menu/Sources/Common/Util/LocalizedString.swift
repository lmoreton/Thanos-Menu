//
//  LocalizedString.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

enum LocalizedString: String {
    
    //MARK: - Error Messages
    
    case errorAlertDefaultTitle
    case errorAlertDefaultAction
    case notPossibleConnect
    case requestTimeOut
    case invalidInput
    case somethingWrong
    
    //MARK: - Commom Messages

    case tryAgain
    case cancel
    case yes
    case no
    
    //MARK: - Computed Properties
    
    var localized: String {
        return self.rawValue.localized()
    }
}
