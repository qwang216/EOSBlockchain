//
//  EOSBlockListViewModel.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class EOSBlockListViewModel: EOSBlockListViewable {
    var title: String {
        return "EOS Recent Blocks"
    }

    private var blocks = [Int]()
    private let eosManager: EOSManagerable

    weak var delegate: EOSViewModelDelegate?

    var blockCounts: Int {
        return blocks.count
    }

    var shouldDisplayItems: Bool {
        return blocks.count > 0
    }

    func blockItem(_ index: Int) -> Int {
        return blocks[index]
    }

    init(eosManager: EOSManagerable) {
        self.eosManager = eosManager
    }

    func fetchMostRecentBlocks(_ count: Int) {
        delegate?.loading(state: .start)
        eosManager.getRecentBlockNum { [weak self] (result) in
            switch result {
            case .success(let blockNum):
                self?.blocks.removeAll()
                for i in 0..<count {
                    self?.blocks.append(blockNum - i)
                }
                DispatchQueue.main.async {
                    self?.delegate?.viewModelUpdated()
                    self?.delegate?.loading(state: .stop(status: .success))
                }
            case .failure(let err):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.loading(state: .stop(status: .failure(err: err)))
                }
            }
        }
    }

}
