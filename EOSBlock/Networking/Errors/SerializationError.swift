//
//  SeralizationErros.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum SerializationError {
    case missing(String)
}

extension SerializationError: Error {
    var localizedDescription: String {
        switch self {
        case .missing(let obj):
            return "Missing field: \(obj)"
        }
    }
}
