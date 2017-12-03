//
//  Int32Extension.swift
//  CameraRawPSConnector
//
//  Created by Zhe Xian Lee on 2/12/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

import Foundation

public extension Int32 {
    func bigEndianByteArray() -> [UInt8] {
        return [
            UInt8(truncatingIfNeeded: self >> 24),
            UInt8(truncatingIfNeeded: self >> 16),
            UInt8(truncatingIfNeeded: self >> 8),
            UInt8(truncatingIfNeeded: self)
        ]
    }
}
