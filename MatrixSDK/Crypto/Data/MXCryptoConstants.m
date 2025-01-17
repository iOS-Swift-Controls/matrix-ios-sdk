/*
 Copyright 2016 OpenMarket Ltd
 Copyright 2017 Vector Creations Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXCryptoConstants.h"

NSString *const kMXCryptoOlmAlgorithm                   = @"m.olm.v1.curve25519-aes-sha2";
NSString *const kMXCryptoMegolmAlgorithm                = @"m.megolm.v1.aes-sha2";
NSString *const kMXCryptoCurve25519KeyBackupAlgorithm   = @"m.megolm_backup.v1.curve25519-aes-sha2";
NSString *const kMXCryptoAes256KeyBackupAlgorithm       = @"org.matrix.msc3270.v1.aes-hmac-sha2";
NSString *const MXCryptoOlmPickleKeyDataType            = @"org.matrix.sdk.olm.pickle.key";


#pragma mark - Encrypting error

NSString *const MXEncryptingErrorDomain = @"org.matrix.sdk.encryption";

NSString* const MXEncryptingErrorUnknownDeviceReason = @"This room contains unknown devices which have not been verified. We strongly recommend you verify them before continuing.";

NSString* const MXEncryptingErrorUnknownDeviceDevicesKey = @"MXEncryptingErrorUnknownDeviceDevicesKey";


#pragma mark - Backup error

NSString *const MXKeyBackupErrorDomain = @"MXKeyBackupErrorDomain";
