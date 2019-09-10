//
//  GetBlockInfo.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct GetBlockInfo: APIExecutable, APIJSONMapper {
    var relativePath: String = "/chain/get_info"
}
