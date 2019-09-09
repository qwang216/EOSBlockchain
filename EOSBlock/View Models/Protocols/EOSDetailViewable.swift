//
//  EOSDetailViewable.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol EOSDetailViewable {
    var producer: String { get }
    var signature: String { get }
    var txnCount: String { get }
    var blockJSON: String { get }
    var delegate: EOSViewModelDelegate? { get set }
    func fetchBlockDetail()
}
