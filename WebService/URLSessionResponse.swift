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
    
//    func isValid() throws -> Data {
//        if let error = error {
//            throw error
//        }
//
//        /// Check if it is of Valid HTTPURLResponse type, data is present & status code doesn't belong to emptyData set
//        guard let response = response as? HTTPURLResponse,
//            let data = data,
//            !emptyDataStatusCodes.contains(response.statusCode) else {
//                return Data()
//        }
//
//        if acceptableStatusCodes.contains(response.statusCode) {
//            return data
//        } else {
//            return data
//        }
//    }
    
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


