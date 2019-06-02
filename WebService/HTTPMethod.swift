//
//  HTTPMethod.swift
//  WebService
//
//  Created by Sanju on 24/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case put
    case delete
    
    var stringValue: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}


//extension HTTPMethod {
//    public func map<B>(_ transform: (Body) -> B) -> HTTPMethod<B> {
//        switch self {
//        case .get: return .get
//        case .delete: return .delete
//        case .post(let body): return .post(transform(body))
//        case .put(let body): return .put(transform(body))
//        }
//    }
//}
