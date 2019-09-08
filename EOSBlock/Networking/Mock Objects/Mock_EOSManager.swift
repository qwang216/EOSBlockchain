//
//  Mock_EOSManager.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class Mock_EOSManager: EOSManagerable {

    func getRecentBlockNum(completion: @escaping EOSResult<Int>) {
        completion(.success(123420))
    }

}
