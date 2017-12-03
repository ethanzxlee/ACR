//
//  PSConnection.swift
//  CameraRawPSConnector
//
//  Created by Zhe Xian Lee on 2/12/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

import Foundation

public class PSConnection {
    
    enum ContentType: Int32 {
        case illegal = 0
        case error = 1
        case javascript = 2
        case image = 3
        case profile = 4
        case data = 5
    }
    
    var readStream: Unmanaged<CFReadStream>?
    var writeStream: Unmanaged<CFWriteStream>?
    var inputStream: InputStream!
    var outputStream: OutputStream!
   
    var streamsOpened: Bool {
        return inputStream.streamStatus == .open && outputStream.streamStatus == .open
    }
    
    public init?(host: String, port: UInt32, password: String) {
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host as CFString, port, &readStream, &writeStream)
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        
        inputStream.open()
        outputStream.open()
        
        while inputStream.streamStatus == .opening || outputStream.streamStatus == .opening {}

        if !streamsOpened {
            return nil
        }

        performTest()
        
    }

    
    public func close() {
        inputStream.close()
        outputStream.close()
    }
    
    public func performTest() {
        
    }
}
