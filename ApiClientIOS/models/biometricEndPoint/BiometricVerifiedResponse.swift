//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

public struct BiometricVerifiedResponse: Codable {

    public var transactionId: String
    public var remainingTries: Int?
    public var hit: Bool = true
    public var documentImage: String?
    public var documentExpirationDate: String?
    public var token: String?
    public var authorizedDataSources: [String]?
    public var message: String?

    public init(transactionId: String, remainingTries: Int? = nil, hit: Bool = true, documentImage: String? = nil, documentExpirationDate: String? = nil, token: String? = nil, authorizedDataSources: [String]? = nil, message: String? = nil) {
        self.transactionId = transactionId
        self.remainingTries = remainingTries
        self.hit = hit
        self.documentImage = documentImage
        self.documentExpirationDate = documentExpirationDate
        self.token = token
        self.authorizedDataSources = authorizedDataSources
        self.message = message
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case transactionId
        case remainingTries
        case hit
        case documentImage
        case documentExpirationDate
        case token
        case authorizedDataSources
        case message
    }
}
