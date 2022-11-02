//
//  File.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import Foundation
public struct ValidationProblemDetails: Codable, Error {

    public var type: String?
    public var title: String?
    public var status: Int?
    public var detail: String?
    public var instance: String?
    public var errors: [String: [String]]?

    public init(type: String? = nil, title: String? = nil, status: Int? = nil, detail: String? = nil, instance: String? = nil, errors: [String: [String]]? = nil) {
        self.type = type
        self.title = title
        self.status = status
        self.detail = detail
        self.instance = instance
        self.errors = errors
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case title
        case status
        case detail
        case instance
        case errors
    }
}
