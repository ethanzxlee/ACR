//
//  PhotoEditingViewController.swift
//  ACREditingExtension
//
//  Created by Zhe Xian Lee on 3/12/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

import CoreFoundation
import Cocoa
import Photos
import PhotosUI
import ACRShared

class PhotoEditingViewController: NSViewController, PHContentEditingController {

    var input: PHContentEditingInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let protocolVersion: Int32 = 1
//        let messageId: Int32 = 10
//
//        let js = "var fileRef = File('/Users/zxlee/Downloads/DSC_4063.NEF');var docRef = app.open(fileRef);"
//
//        // Construct the message
//        var contentBytes = [UInt8]()
//
//        contentBytes.append(contentsOf: protocolVersion.bigEndianByteArray())
//        contentBytes.append(contentsOf: messageId.bigEndianByteArray())
//        contentBytes.append(contentsOf: Int32(2).bigEndianByteArray())
//        contentBytes.append(contentsOf: js.utf8)
//        contentBytes.append(0x0a)
//
//        let psCryptor = PSCryptorAPIWrapper.createPSCryptorWrapper("10Zhexian01")
//        let dataToEncrypt = Data(bytes: contentBytes)
//
//        let result = PSCryptorAPIWrapper.encryptData(dataToEncrypt, withPSCryptor: psCryptor)
//
//        if result.status.rawValue != 0 {
//            print("failed to encrypt")
//        }
//
//        let messageLength = Int32(result.dataLength + MemoryLayout<Int32>.size)
//        let encryptedData = Data(bytes: result.data, count: result.dataLength)
//
        var entireMessage = [UInt8]()
        entireMessage.append(123)
//        entireMessage.append(contentsOf: messageLength.bigEndianByteArray())
//        entireMessage.append(contentsOf: Int32(0).bigEndianByteArray())
//        entireMessage.append(contentsOf: encryptedData)
        
        var entireMessageData = Data(bytes: entireMessage)
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        let connection = PSConnection(host: "127.0.0.1", port: 49494, password:"10Zhexian01")
        print(connection)
        
        //        print(UserDefaults.standard.object(forKey: "yourpass"))
        //        UserDefaults.standard.set("ww101010ww", forKey: "yourpass")
//
//        let userDefaults = UserDefaults(suiteName: "group.com.zhexianlee.CameraRawPSConnector")
//        userDefaults?.set("ww101010ww", forKey: "yourpass")
        
        //        result.data
//        free(result.data)
//        PSCryptorAPIWrapper.destroyPSCryptorWrapper(psCryptor)
//                CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "127.0.0.1" as CFString, 49494, &readStream, &writeStream)
//
//                var inputStream: InputStream! = readStream!.takeRetainedValue()
//                var outputStream: OutputStream! = writeStream!.takeRetainedValue()
//
//                inputStream.open()
//                outputStream.open()
//
//                var inputBytes = UnsafeMutablePointer<UInt8>.allocate(capacity: 10)
//
////                let te = Int32(0).bigEndianByteArray()
//
//                print(outputStream.write(&entireMessage, maxLength: entireMessage.count))
//                inputStream.read(inputBytes, maxLength: 1)
                //inputStream.hasBytesAvailable
//                print(inputBytes)
        
//                outputStream.close()
//                inputStream.close()
//       
    }

    // MARK: - PHContentEditingController

    func canHandle(_ adjustmentData: PHAdjustmentData) -> Bool {
        // Inspect the adjustmentData to determine whether your extension can work with past edits.
        // (Typically, you use its formatIdentifier and formatVersion properties to do this.)
        return false
    }
    
    func startContentEditing(with contentEditingInput: PHContentEditingInput, placeholderImage: NSImage) {
        // Present content for editing, and keep the contentEditingInput for use when closing the edit session.
        // If you returned true from canHandleAdjustmentData:, contentEditingInput has the original image and adjustment data.
        // If you returned false, the contentEditingInput has past edits "baked in".
        input = contentEditingInput
    }
    
    func finishContentEditing(completionHandler: @escaping ((PHContentEditingOutput?) -> Void)) {
        // Update UI to reflect that editing has finished and output is being rendered.
        
        // Render and provide output on a background queue.
        DispatchQueue.global().async {
            // Create editing output from the editing input.
            let output = PHContentEditingOutput(contentEditingInput: self.input!)
            
            // Provide new adjustments and render output to given location.
            // output.adjustmentData = <#new adjustment data#>
            // let renderedJPEGData = <#output JPEG#>
            // renderedJPEGData.writeToURL(output.renderedContentURL, atomically: true)
            
            // Call completion handler to commit edit to Photos.
            completionHandler(output)
            
            // Clean up temporary files, etc.
        }
    }

    var shouldShowCancelConfirmation: Bool {
        // Determines whether a confirmation to discard changes should be shown to the user on cancel.
        // (Typically, this should be "true" if there are any unsaved changes.)
        return false
    }

    func cancelContentEditing() {
        // Clean up temporary files, etc.
        // May be called after finishContentEditingWithCompletionHandler: while you prepare output.
    }

}
