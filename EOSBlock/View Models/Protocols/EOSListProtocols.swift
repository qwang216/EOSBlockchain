//
//  EOSListProtocols.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol EOSBlockListViewModelDelegate: class {
    func viewModelUpdated()
    func loading(state: LoadingState<EOSManagerError>)
}

protocol EOSBlockListViewable {
    var delegate: EOSBlockListViewModelDelegate? { get set }
    var blockCounts: Int { get }
    var title: String { get }
    var shouldDisplayItems: Bool { get }
    func fetchMostRecentBlocks(_ count: Int)
    func blockItem(_ index: Int) -> String
}
