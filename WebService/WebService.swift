//
//  WebService.swift
//  WebService
//
//  Created by Sanju on 24/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

open class WebService {
    public static func load<T: Codable>(_ resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: resource.urlRequest) { (data, response, error) in
            let sessionResponse = URLSessionResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(resource.parse(sessionResponse))
            }
        }.resume()
    }
}
