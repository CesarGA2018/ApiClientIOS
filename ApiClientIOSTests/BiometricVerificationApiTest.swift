//
//  BiometricVerificationTest.swift
//  
//
//  Created by Cesar G. on 10/10/22.
//

import XCTest
@testable import ApiClientIOS

final class BiometricVerificationApiTest: XCTestCase {
    let sut = BiometricVerificationAPI(provider: BiometricVerificationProviderMock())
    
    func testSuccessResponseStatus200() throws {
        
        var biometricRequest = BiometricVerificationRequest()
        biometricRequest.finger = .rightIndex
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0ZTExNDgyNS1lMDEzLTRiNmQtODgxOC1kYzI4YjdiZDA5ODkiLCJCaW9BcGkuRG9jdW1lbnRUeXBlIjoiRm9yZWlnbmVyIiwiQmlvQXBpLkRvY3VtZW50TnVtYmVyIjoiMTA2MTc3NjU2NiIsIkJpb0FwaS5UcmFuc2FjdGlvbklkIjoiMTRjYTBhMzQtYjMzNi00YzRjLThjYTMtMTBmYzVhZmMwOGQzIiwiQmlvQXBpLkJlYXJlclNTTyI6IioiLCJCaW9BcGkuQmlvbWV0cmljVmVyaWZpY2F0aW9uIjoiQmlvQXBpLkJpb21ldHJpY1ZlcmlmaWNhdGlvbiIsImV4cCI6MTY2NjM4NjI1MywiaXNzIjoiaHR0cHM6Ly9nZXRncm91cGJpb2FwaWRldi5henVyZXdlYnNpdGVzLm5ldC8iLCJhdWQiOiJodHRwczovL2dldGdyb3VwYmlvYXBpZGV2LmF6dXJld2Vic2l0ZXMubmV0LyJ9.blJso5QUcF3dA-63_MW3B2iIDj94q9gysh3qUJOH9VQ"
        
        sut.BiometricVerificationPost(biometricVerificationRequest: biometricRequest, token: token, completion: { response, error in
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            if let rs = response {
                XCTAssertEqual(rs.hit, true)
                XCTAssertEqual(rs.transactionId, "14ca0a34-b336-4c4c-8ca3-10fc5afc08d3")
            }
        })
    }
}
