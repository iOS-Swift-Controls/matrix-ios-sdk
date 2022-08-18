//
// Copyright 2022 The Matrix.org Foundation C.I.C
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

#if DEBUG && os(iOS)

import MatrixSDKCrypto

/// A set of protocols defining the functionality in `MatrixSDKCrypto` and separating them into logical units

@available(iOS 13.0.0, *)
protocol MXCryptoSyncing {
    func handleSyncResponse(
        toDevice: MXToDeviceSyncResponse?,
        deviceLists: MXDeviceListResponse?,
        deviceOneTimeKeysCounts: [String: NSNumber],
        unusedFallbackKeys: [String]?
    ) throws
    
    func completeSync() async throws
}

protocol MXCryptoDevicesSource {
    var deviceCurve25519Key: String? { get }
    var deviceEd25519Key: String? { get }
    func device(userId: String, deviceId: String) -> Device?
    func devices(userId: String) -> [Device]
}

protocol MXCryptoUserIdentitySource {
    func userIdentity(userId: String) -> UserIdentity?
    func isUserVerified(userId: String) -> Bool
}

@available(iOS 13.0.0, *)
protocol MXCryptoEventEncrypting {
    func shareRoomKeysIfNecessary(roomId: String, users: [String]) async throws
    func encrypt(_ content: [AnyHashable: Any], roomId: String, eventType: String, users: [String]) async throws -> [String: Any]
    func decryptEvent(_ event: MXEvent) throws -> MXEventDecryptionResult
}

@available(iOS 13.0.0, *)
protocol MXCryptoCrossSigning {
    func crossSigningStatus() -> CrossSigningStatus
    func bootstrapCrossSigning(authParams: [AnyHashable: Any]) async throws
}

#endif