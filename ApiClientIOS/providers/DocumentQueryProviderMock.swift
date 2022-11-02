//
//  File.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import Foundation

struct DocumentQueryProviderMock: DocumentQueryProviderProtocol {
    enum mockNames: String {
        case DocumentAvailableResponseMock
        case DocumentQueryResponseBaseMock
        case ProblemDetailsMock
        case ValidationProblemDetailsMock
        case NoMock
    }
    
    init() {}
    
    func documentQuery(documentType: DocumentTypeEnumeration, documentNumber: String, bearerSSO: String, completion: @escaping ((DocumentAvailableResponse?, Error?) -> Void)) {
        let jsonNameProcess = getJsonName(documentNumber: documentNumber)

        let bundle = Bundle(identifier: "com.co.getgroup.ApiClientIOS")
        if let path = bundle!.path(forResource: jsonNameProcess.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                switch jsonNameProcess {
                case mockNames.DocumentAvailableResponseMock:
                    let sussessResponse = try JSONDecoder().decode(DocumentAvailableResponse.self, from: data)
                    completion(sussessResponse,nil)
                case mockNames.DocumentQueryResponseBaseMock:
                    let fairuleResponse = try JSONDecoder().decode(DocumentQueryResponseBase.self, from: data)
                    completion(nil,fairuleResponse)
                case mockNames.ProblemDetailsMock:
                    let fairuleResponse = try JSONDecoder().decode(ProblemDetails.self, from: data)
                    completion(nil,fairuleResponse)
                case mockNames.ValidationProblemDetailsMock:
                    let fairuleResponse = try JSONDecoder().decode(ValidationProblemDetails.self, from: data)
                    completion(nil,fairuleResponse)
                default:
                    completion(nil,nil)
                }
                
            } catch let jsonerr {
                print("Error en el mock: ", jsonerr)
                completion(nil, nil)
            }
        }
    }
    
    func getJsonName(documentNumber: String) -> mockNames {
        switch documentNumber {
        case "1234566":
            return mockNames.DocumentAvailableResponseMock
        case "asdf":
            return mockNames.ValidationProblemDetailsMock
        case "123456688":
            return mockNames.ProblemDetailsMock
        case "123456":
            return mockNames.DocumentQueryResponseBaseMock
        default:
            return mockNames.NoMock
        }
    }
}
