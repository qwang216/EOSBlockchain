//
//  EOSManagerable.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

typealias EOSResult<T> = (Result<T, EOSManagerError>) -> Void

protocol EOSManagerable {
    func getRecentBlockNum(completion: @escaping EOSResult<Int>)
    func getDataOnBlock(number: Int, completion: @escaping EOSResult<EOSBlockObj>)
}
