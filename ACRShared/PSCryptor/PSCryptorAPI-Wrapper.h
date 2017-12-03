//
//  PSCryptorAPI-Wrapper.h
//  CameraRawPSConnector
//
//  Created by Zhe Xian Lee on 2/12/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "PSCryptorAPI.h"

struct PSCryptorResult {
    PSCryptorStatus status;
    size_t dataLength;
    void * data;
};

@interface PSCryptorAPIWrapper : NSObject

+ (PSCryptorRef) createPSCryptorWrapper:(NSString *) password;

+ (void) destroyPSCryptorWrapper:(PSCryptorRef) cryptor;

+ (struct PSCryptorResult)encryptData: (NSData *)data withPSCryptor:(PSCryptorRef) cryptorRef;


//size_t CryptorGetEncryptedLength (size_t plainDataLen);
@end
