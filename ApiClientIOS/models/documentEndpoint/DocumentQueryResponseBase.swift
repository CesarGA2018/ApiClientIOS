import Foundation

public struct DocumentQueryResponseBase: Codable, Error {

    public var transactionId: String
    public var biometricAvailable: Bool = false

    public init(transactionId: String, biometricAvailable: Bool = false) {
        self.transactionId = transactionId
        self.biometricAvailable = biometricAvailable
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case transactionId
        case biometricAvailable
    }
}
