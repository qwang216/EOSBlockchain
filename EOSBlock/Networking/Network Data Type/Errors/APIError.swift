//
//  APIError.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum APIError {
    case decode
    case data
    case statusErrorCode(Int?)
    case invalid(String)
    case jsonSerialization
}

extension APIError: Error {
    public var localizedDescription: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .data:
            return "Invalid Data"
        case .statusErrorCode(let code):
            return "Status Code Error: \(code ?? 0)"
        case .invalid(let reason):
            return "Invalid \(reason)"
        case .jsonSerialization:
            return "JSON Serialization Error"
        }
    }
}
