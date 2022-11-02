//
//  DocumentQueryApiTest.swift
//  
//
//  Created by Cesar G. on 4/10/22.
//

import XCTest
@testable import ApiClientIOS

final class DocumentQueryApiTest: XCTestCase {

    let sut = DocumentQueryAPI(provider: DocumentQueryProviderMock())
    
    func testSuccessResponseStatus200() throws {
        sut.DocumentQuery(documentType: .national, documentNumber: "1234566", bearerSSO: "*", completion: { response, error in
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            if let rs = response {
                XCTAssertEqual(rs.biometricAvailable, true)
                XCTAssertEqual(rs.token, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5YTU4ZjU3Ny01ZWM5LTRmZjEtOWI3MS1kZmE4YmVkOGZmMWIiLCJCaW9BcGkuRG9jdW1lbnRUeXBlIjoiTmF0aW9uYWwiLCJCaW9BcGkuRG9jdW1lbnROdW1iZXIiOiIxMjM0NTY2IiwiQmlvQXBpLlRyYW5zYWN0aW9uSWQiOiJmY2I2M2JmOS1mNjgyLTQ1NTktOGYyMi00MTliNDk3YTVkNzgiLCJCaW9BcGkuQmlvbWV0cmljVmVyaWZpY2F0aW9uIjoiQmlvQXBpLkJpb21ldHJpY1ZlcmlmaWNhdGlvbiIsImV4cCI6MTY2NDc5ODQ3MywiaXNzIjoiaHR0cHM6Ly9nZXRncm91cGJpb2FwaWRldi5henVyZXdlYnNpdGVzLm5ldC8iLCJhdWQiOiJodHRwczovL2dldGdyb3VwYmlvYXBpZGV2LmF6dXJld2Vic2l0ZXMubmV0LyJ9.iVBYsX2-SyhtHApZ4hmwG02fk02_dxipoqylJk35TD0")
                XCTAssertEqual(rs.name, "Pepito")
                XCTAssertEqual(rs.surname, "Peréz")
                XCTAssertEqual(rs.secondSurname, "HIT")
                XCTAssertEqual(rs.facialRecognitionAvailable, false)
                XCTAssertEqual(rs.transactionId, "fcb63bf9-f682-4559-8f22-419b497a5d78")
                XCTAssertFalse(rs.availableFingers.isEmpty)
            }
        })
    }
    
    func testSuccessResponseStatus400_ValidationProblemDetails() throws {
        sut.DocumentQuery(documentType: .national, documentNumber: "asdf", bearerSSO: "*", completion: { response, error in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            if let err = error as? ValidationProblemDetails {
                XCTAssertEqual(err.status, 400)
            }
        })
    }
    
    func testSuccessResponseStatus500_ProblemDetails() throws {
        sut.DocumentQuery(documentType: .national, documentNumber: "123456688", bearerSSO: "*", completion: { response, error in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            if let err = error as? ProblemDetails {
                XCTAssertEqual(err.status, 500)
            }
        })
    }
    
    func testSuccessResponseStatus404_DocumentQueryResponseBase() throws {
        sut.DocumentQuery(documentType: .national, documentNumber: "123456", bearerSSO: "*", completion: { response, error in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            if let err = error as? DocumentQueryResponseBase {
                XCTAssertEqual(err.biometricAvailable, false)
            }
        })
    }
}
