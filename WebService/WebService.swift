//
//  WebService.swift
//  WebService
//
//  Created by Sanju on 24/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

public protocol WebServiceProtocol: AnyObject {
    func load<T: Codable>(_ resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void)
}

public class WebService: WebServiceProtocol {
    
    public init() { }
    
    public func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        URLSession.shared.dataTask(with: resource.urlRequest) { (data, response, error) in
            let sessionResponse = URLSessionResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(resource.parse(sessionResponse))
            }
            }.resume()
    }
}
