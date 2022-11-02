import Foundation

public struct DocumentQueryRequest: Codable {

    public var documentType: DocumentTypeEnumeration
    public var documentNumber: String
    public var bearerSSO: String

    public init(documentType: DocumentTypeEnumeration, documentNumber: String, bearerSSO: String) {
        self.documentType = documentType
        self.documentNumber = documentNumber
        self.bearerSSO = bearerSSO
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case documentType
        case documentNumber
        case bearerSSO
    }
}
