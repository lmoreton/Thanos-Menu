//
//  String+Ext.swift
//  thanos menu
//
//  Created by Lucas Moreton on 21/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    var md5: String {
        get {
            guard let data = self.data(using: .utf8) else {
                fatalError("Failed to unwrap data in UTF8")
            }
            
            var digest = Data(count: Int(CC_MD5_DIGEST_LENGTH))
            _ = digest.withUnsafeMutableBytes { digestBytes in
                data.withUnsafeBytes { messageBytes in
                    CC_MD5(messageBytes, CC_LONG(data.count), digestBytes)
                }
            }
            
            return digest.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}

