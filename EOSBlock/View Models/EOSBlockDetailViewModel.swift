//
//  EOSBlockDetailViewModel.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class EOSBlockDetailViewModel: EOSDetailViewable {

    private let eosManager: EOSManagerable
    private let blockNumber: Int

    private var eosBlock: EOSBlockObj?

    weak var delegate: EOSViewModelDelegate?

    init(manager: EOSManagerable, blockNum: Int) {
        eosManager = manager
        blockNumber = blockNum
    }

    var producer: String {
        guard let block = eosBlock else { return "" }
        return "Producer: \(block.producer)"
    }

    var signature: String {
        guard let block = eosBlock else { return "" }
        return "Signature: \(block.producerSignature)"
    }

    var txnCount: String {
        guard let block = eosBlock else { return "" }
        return "Total Transaction: \(block.totalTransaction)"
    }

    var blockJSON: String {
        guard let _ = eosBlock else { return "" }
        // TODO: fix me
        return "JSON goes HERE!!"
    }

    func fetchBlockDetail() {
        delegate?.loading(state: .start)
        eosManager.getDataOnBlock(number: blockNumber) { [weak self] (result) in
            switch result {
            case .success(let blockObj):
                self?.eosBlock = blockObj
                DispatchQueue.main.async {
                    self?.delegate?.loading(state: .stop(status: .success))
                    self?.delegate?.viewModelUpdated()
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    self?.delegate?.loading(state: .stop(status: .failure(err: err)))
                }
            }
        }
    }

}
