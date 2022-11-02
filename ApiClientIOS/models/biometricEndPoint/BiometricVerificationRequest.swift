//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

public struct BiometricVerificationRequest: Codable {

    public var finger: Finger?
    public var fingerPrint: String?
    public var fullFacePhoto: String?

    public init(finger: Finger? = nil, fingerPrint: String? = nil, fullFacePhoto: String? = nil) {
        self.finger = finger
        self.fingerPrint = fingerPrint
        self.fullFacePhoto = fullFacePhoto
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case finger
        case fingerPrint
        case fullFacePhoto
    }
}
