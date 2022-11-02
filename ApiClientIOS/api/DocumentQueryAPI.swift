//
//  File.swift
//  
//
//  Created by Cesar G. on 28/09/22.
//

import Foundation

public class DocumentQueryAPI {
    public var provider: DocumentQueryProviderProtocol!
    public init(provider: DocumentQueryProviderProtocol = DocumentQueryProvider()){
        self.provider = provider
    }
    
    public func DocumentQuery(documentType: DocumentTypeEnumeration, documentNumber: String, bearerSSO: String, completion: @escaping((DocumentAvailableResponse?, Error?) -> Void)) {
        provider.documentQuery(documentType: documentType, documentNumber: documentNumber, bearerSSO: bearerSSO, completion: { response, err  in
            completion(response, err)
        })
    }
}
