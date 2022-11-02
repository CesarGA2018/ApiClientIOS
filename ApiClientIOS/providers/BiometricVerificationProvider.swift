//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

public protocol BiometricVerificationProviderProtocol {
    func biometricVerificationPost(biometricVerificationRequest: BiometricVerificationRequest, token: String, completion: @escaping ((_ data: BiometricVerifiedResponse?, _ error: Error?) -> Void))
}

public struct BiometricVerificationProvider: BiometricVerificationProviderProtocol {
    public init() {}
    public func biometricVerificationPost(biometricVerificationRequest: BiometricVerificationRequest, token: String, completion: @escaping ((BiometricVerifiedResponse?, Error?) -> Void)) {
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(biometricVerificationRequest) {
            Networking().sendPostRequest(from: URL(string: Constants.URL.rawValue + Constants.BiometricEndpoint.rawValue)!, body: encoded, token: token) {result, status in
                switch result {
                case .success(let data):
                    let successRange = 0...200
                    let validationProblemRange = 201...400
                    let responseBaseProblem = 401...404
                    
                    if successRange.contains(status){
                        do {
                            let result = try  JSONDecoder().decode(BiometricVerifiedResponse.self, from: data)
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
                            let result = try  JSONDecoder().decode(BiometricVerificationResponseBase.self, from: data)
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
