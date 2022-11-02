//
//  File.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import Foundation

public protocol DocumentQueryProviderProtocol {
    func documentQuery(documentType: DocumentTypeEnumeration, documentNumber: String, bearerSSO: String, completion: @escaping ((_ data: DocumentAvailableResponse?, _ error: Error?) -> Void))
}

public struct DocumentQueryProvider: DocumentQueryProviderProtocol {
    public init() {}
    
    public func documentQuery(documentType: DocumentTypeEnumeration, documentNumber: String, bearerSSO: String, completion: @escaping ((DocumentAvailableResponse?, Error?) -> Void)) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(DocumentQueryRequest(documentType: documentType, documentNumber: documentNumber, bearerSSO: bearerSSO)) {
            Networking().sendPostRequest(from: URL(string: Constants.URL.rawValue + Constants.DocumentEndpoint.rawValue)!, body: encoded) { result, status  in
                    switch result {
                    case .success(let data):
                        let successRange = 0...200
                        let validationProblemRange = 201...400
                        let responseBaseProblem = 401...404
                        
                        if successRange.contains(status){
                            do {
                                let result = try  JSONDecoder().decode(DocumentAvailableResponse.self, from: data)
                                completion(result, nil)
                            } catch { print(error) }
                        }
                        else if validationProblemRange.contains(status) {
                            do {
                                let result = try  JSONDecoder().decode(ValidationProblemDetails.self, from: data)
                                completion(nil, result)
                            } catch { print(error) }
                        }
                        else if responseBaseProblem.contains(status) {
                            do {
                                let result = try  JSONDecoder().decode(DocumentQueryResponseBase.self, from: data)
                                completion(nil, result)
                            } catch { print(error) }
                        }
                        else {
                            do {
                                let result = try  JSONDecoder().decode(ProblemDetails.self, from: data)
                                completion(nil, result)
                            } catch { print(error) }
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}
