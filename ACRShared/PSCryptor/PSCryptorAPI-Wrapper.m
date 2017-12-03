//
//  PSCryptorAPI-Wrapper.m
//  CameraRawPSConnector
//
//  Created by Zhe Xian Lee on 2/12/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "PSCryptorAPI-Wrapper.h"

@implementation PSCryptorAPIWrapper

+ (PSCryptorRef)createPSCryptorWrapper:(NSString *)password {
    PSCryptorRef psCryptorRef = CreatePSCryptor([password UTF8String]);
    return psCryptorRef;
}

+ (void) destroyPSCryptorWrapper:(PSCryptorRef) cryptor {
    DestroyPSCryptor(cryptor);
}

+ (struct PSCryptorResult)encryptData: (NSData *)data withPSCryptor:(PSCryptorRef) cryptorRef {
    const void * toEncryptBytes = [data bytes];
    size_t dataLength = (size_t) [data length];
    
    size_t outputDataLength = CryptorGetEncryptedLength(dataLength);
    void * outputData = malloc(dataLength * sizeof(void));

    struct PSCryptorResult result;
    result.status = EncryptDecrypt(cryptorRef, YES, toEncryptBytes, dataLength, outputData, outputDataLength, &outputDataLength);
    result.data = outputData;
    result.dataLength = outputDataLength;
    
    return result;
}

@end
