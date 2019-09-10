//
//  PostBlockDetail.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct PostBlockDetail: APIExecutable, APIJSONMapper {
    let relativePath: String = "/chain/get_block"
    var method: HTTPMethod = .POST
    var body: JSON?

    init(blockNum: Int) {
        body = [
            "block_num_or_id" : blockNum
        ]
    }
}
