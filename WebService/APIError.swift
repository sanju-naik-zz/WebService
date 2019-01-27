//
//  APIError.swift
//  WebService
//
//  Created by Sanju on 27/01/19.
//  Copyright © 2019 Sanju. All rights reserved.
//

import Foundation

struct APIError: Codable, Error {
    let statusCode: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message = "message"
    }
}
