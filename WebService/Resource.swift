//
//  Resource.swift
//  WebService
//
//  Created by Sanju on 23/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

public struct Resource<T: Codable> {
    var urlRequest: URLRequest
    let parse: (URLSessionResponse) -> Result<T, Error>
}


extension Resource {
    /// GET Request Initializer.
    public init(get url: String, parameters: [String: Any]? = nil) {
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.key, value: String(describing: $0.value)) })
        self.urlRequest = URLRequest(url: urlComponents.url!)
        
        self.parse = { response in
            return Result(catching: {
                switch response.validate() {
                case .success(let data):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        return result
                    } catch {
                        throw error
                    }
                    
                case .error(let data):
                    do {
                        let error = try JSONDecoder().decode(APIError.self, from: data)
                        throw error
                    } catch {
                        throw error
                    }
                    
                case .networkError(let error):
                    throw error
                }
            })
        }
    }
    
    
    /// POST/PUT Requests Initializer.
    public init<Body: Encodable>(url: URL, method: HTTPMethod<Body>) {
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        let methodData = method.map({ (body) in
            return try! JSONEncoder().encode(body)
        })
        
        if case let .post(data) = methodData {
            urlRequest.httpBody = data
        }
        if case let .put(data) = methodData {
            urlRequest.httpBody = data
        }
        self.parse = { response in
            return Result(catching: {
                switch response.validate() {
                case .success(let data):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        return result
                    } catch {
                        throw error
                    }
                    
                case .error(let data):
                    do {
                        let error = try JSONDecoder().decode(APIError.self, from: data)
                        throw error
                    } catch {
                        throw error
                    }
                    
                case .networkError(let error):
                    throw error
                }
            })
        }
    }
}
