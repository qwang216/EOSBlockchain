//
//  EOSManagerError.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum EOSManagerError {
    case failedFetchRecentBlock
    case failedFetchBlockDetail
}

extension EOSManagerError: LocalizedError {
    var failureReason: String? {
        switch self {
        case .failedFetchRecentBlock:
            return "Unable To Fetch Recent Blocks"
        case .failedFetchBlockDetail:
            return "Failed Fetching Block Detail"
        }
    }
}
