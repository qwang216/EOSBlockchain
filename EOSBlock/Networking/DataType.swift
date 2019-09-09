//
//  DataType.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation


typealias JSON = [String: Any]
typealias EOSResultClosure<T,E: Error> = (Result<T, E>) -> Void
