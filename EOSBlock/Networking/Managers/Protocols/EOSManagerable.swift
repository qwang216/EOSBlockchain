//
//  EOSManagerable.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol EOSManagerable {
    func getRecentBlockNum(completion: @escaping EOSResultClosure<Int, EOSManagerError>)
    func getDataOnBlock(number: Int, completion: @escaping EOSResultClosure<EOSBlockObj, EOSManagerError>)
}
