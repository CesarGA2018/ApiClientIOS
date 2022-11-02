//
//  File.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import Foundation

public class BiometricVerificationAPI {
    public var provider: BiometricVerificationProviderProtocol!
    public init(provider: BiometricVerificationProviderProtocol = BiometricVerificationProvider()){
        self.provider = provider
    }
    
    public func BiometricVerificationPost(biometricVerificationRequest: BiometricVerificationRequest, token: String, completion: @escaping ((BiometricVerifiedResponse?, Error?) -> Void)) {
        provider.biometricVerificationPost(biometricVerificationRequest: biometricVerificationRequest, token: token, completion: { response, err  in
            completion(response, err)
        })
    }
}
