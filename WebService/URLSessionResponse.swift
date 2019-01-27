//
//  URLSessionResponse.swift
//  WebService
//
//  Created by Sanju on 24/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

enum ValidationResult {
    case success(Data)
    case error(Data)
    case networkError(Error)
}

struct URLSessionResponse {
    
    let emptyDataStatusCodes: Set<Int> = [204, 205]
    let acceptableStatusCodes = Array(200..<300)
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
}


extension URLSessionResponse {
    
    func validate() -> ValidationResult {
        if let error = error {
            return .networkError(error)
        }
        
        guard let response = response as? HTTPURLResponse,
            let data = data,
            !emptyDataStatusCodes.contains(response.statusCode) else {
                return .success(Data())
        }
        
        if acceptableStatusCodes.contains(response.statusCode) {
            return .success(data)
        } else {
            return .error(data)
        }
    }
}


