//
//  DocumentQueryApiIntegratedTest.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import XCTest
@testable import ApiClientIOS

final class DocumentQueryApiIntegratedTest: XCTestCase {
    let sut = DocumentQueryAPI()
    
    func testComunicationForApi() throws {
        try XCTSkipIf(!ConstantsTest().activeIntegrationTest)
        let asyncExpectation = expectation(description: "DocumentQueryWorkingFunction")

        sut.DocumentQuery(documentType: .national, documentNumber: "1234566", bearerSSO: "*") { response, err in
             asyncExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 60) { error in
             XCTAssertNil(error)
         }
    }
    
    func testComunicationForApiRetrive404() throws {
        try XCTSkipIf(!ConstantsTest().activeIntegrationTest)
        let asyncExpectation = expectation(description: "DocumentQueryWorkingFunction")

        sut.DocumentQuery(documentType: .national, documentNumber: "123456", bearerSSO: "*") { response, err in
             asyncExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 60) { error in
             XCTAssertNil(error)
         }
    }
    
    func testComunicationForApiRetrive400() throws {
        try XCTSkipIf(!ConstantsTest().activeIntegrationTest)
        let asyncExpectation = expectation(description: "DocumentQueryWorkingFunction")

        sut.DocumentQuery(documentType: .national, documentNumber: "1234588", bearerSSO: "*") { response, err in
             asyncExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 60) { error in
             XCTAssertNil(error)
         }
    }
    
}
