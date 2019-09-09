//
//  LoadingStates.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum LoadingStatus<T> {
    case success
    case failure(err: T)
}

enum LoadingState<T: LocalizedError> {
    case start
    case stop(status: LoadingStatus<T>)
}
