//
//  Result.swift
//  WebService
//
//  Created by Sanju on 24/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

extension Result {
    
}

//public enum Result<T: Codable> {
//    case success(T)
//    case error(Error)
//
//    init(_ validationResult: ValidationResult) {
//        switch validationResult {
//        case .success(let data):
//            do {
//                let result = try JSONDecoder().decode(T.self, from: data)
//                self = .success(result)
//            } catch {
//                self = .error(error)
//            }
//
//        case .error(let data):
//            do {
//              let error = try JSONDecoder().decode(APIError.self, from: data)
//                self = .error(error)
//            } catch {
//                self = .error(error)
//            }
//
//        case .networkError(let error):
//            self = .error(error)
//        }
//    }
//}


