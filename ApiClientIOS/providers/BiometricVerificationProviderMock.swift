//
//  File.swift
//  
//
//  Created by Cesar G. on 12/10/22.
//

import Foundation

struct BiometricVerificationProviderMock: BiometricVerificationProviderProtocol {
    enum mockNames: String {
        case BiometricVerifiedResponse
        case BiometricVerificationResponseBase
        case ProblemDetailsMock
        case ValidationProblemDetailsMock
        case NoMock
    }
    
    init() {}
    
    // TODO: Hace falta agregar los casos de error, validar con Walter
    func biometricVerificationPost(biometricVerificationRequest: BiometricVerificationRequest, token: String, completion: @escaping ((BiometricVerifiedResponse?, Error?) -> Void)) {
        let jsonNameProcess = getJsonName(token: token)
        let bundle = Bundle(identifier: "com.co.getgroup.ApiClientIOS")
        if let path = bundle!.path(forResource: jsonNameProcess.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                switch jsonNameProcess {
                case mockNames.BiometricVerifiedResponse:
                    let sussessResponse = try JSONDecoder().decode(BiometricVerifiedResponse.self, from: data)
                    completion(sussessResponse,nil)
                default:
                    completion(nil,nil)
                }
                
            } catch let jsonerr {
                print("Error en el mock: ", jsonerr)
                completion(nil, nil)
            }
        }
    }
    
    
    func getJsonName(token: String) -> mockNames {
        switch token {
        case Constants.TokenSuccessBiometric.rawValue:
            return mockNames.BiometricVerifiedResponse
       
        default:
            return mockNames.NoMock
        }
    }
}

