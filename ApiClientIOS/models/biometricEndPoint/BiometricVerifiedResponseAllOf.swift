//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

public struct BiometricVerifiedResponseAllOf: Codable {
    public var hit: Bool = true
    public var documentImage: String?
    public var documentExpirationDate: Date?
    public var token: String?
    public var authorizedDataSources: [String]?

    public init(hit: Bool = true, documentImage: String? = nil, documentExpirationDate: Date? = nil, token: String? = nil, authorizedDataSources: [String]? = nil) {
        self.hit = hit
        self.documentImage = documentImage
        self.documentExpirationDate = documentExpirationDate
        self.token = token
        self.authorizedDataSources = authorizedDataSources
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case hit
        case documentImage
        case documentExpirationDate
        case token
        case authorizedDataSources
    }
}
