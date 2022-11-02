//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

public struct BiometricVerificationResponseBase: Codable, Error {

    public var transactionId: String
    public var remainingTries: Int?
    public var hit: Bool = false

    public init(transactionId: String, remainingTries: Int? = nil, hit: Bool = false) {
        self.transactionId = transactionId
        self.remainingTries = remainingTries
        self.hit = hit
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case transactionId
        case remainingTries
        case hit
    }
}
