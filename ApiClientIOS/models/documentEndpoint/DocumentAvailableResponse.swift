import Foundation

public struct DocumentAvailableResponse: Codable {

    public var transactionId: String
    public var biometricAvailable: Bool = true
    public var token: String
    public var availableFingers: [Finger]
    public var facialRecognitionAvailable: Bool
    public var name: String?
    public var surname: String?
    public var secondSurname: String?

    public init(transactionId: String, biometricAvailable: Bool = true, token: String, availableFingers: [Finger], facialRecognitionAvailable: Bool, name: String? = nil, surname: String? = nil, secondSurname: String? = nil) {
        self.transactionId = transactionId
        self.biometricAvailable = biometricAvailable
        self.token = token
        self.availableFingers = availableFingers
        self.facialRecognitionAvailable = facialRecognitionAvailable
        self.name = name
        self.surname = surname
        self.secondSurname = secondSurname
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case transactionId
        case biometricAvailable
        case token
        case availableFingers
        case facialRecognitionAvailable
        case name
        case surname
        case secondSurname
    }
}
