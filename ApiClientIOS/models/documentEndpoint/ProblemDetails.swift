import Foundation

public struct ProblemDetails: Codable, Error {
    public var type: String?
    public var title: String?
    public var status: Int?
    public var detail: String?
    public var instance: String?

    public init(type: String? = nil, title: String? = nil, status: Int? = nil, detail: String? = nil, instance: String? = nil) {
        self.type = type
        self.title = title
        self.status = status
        self.detail = detail
        self.instance = instance
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case title
        case status
        case detail
        case instance
    }
}

