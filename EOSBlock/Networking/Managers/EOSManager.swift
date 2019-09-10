//
//  EOSManager.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class EOSManager: EOSManagerable {

    func getRecentBlockNum(completion: @escaping EOSResultClosure<Int, EOSManagerError>) {
        let getInfo = GetBlockInfo()
        getInfo.mapExecuteRequest { (result) in
            switch result {
            case .success(let json):
                guard let recentBlock = json["last_irreversible_block_num"] as? Int else {
                    completion(.failure(.failedFetchRecentBlock))
                    return
                }
                completion(.success(recentBlock))
            case .failure(let err):
                completion(.failure(.onError(err)))
            }
        }
    }

    func getDataOnBlock(number: Int, completion: @escaping EOSResultClosure<EOSBlockObj, EOSManagerError>) {
        let blockDetail = PostBlockDetail(blockNum: number)
        blockDetail.mapExecuteRequest { (result) in
            switch result {
            case .success(let json):

                do {
                    let block = try EOSBlockObj(json: json)
                    completion(.success(block))
                } catch {
                    completion(.failure(.onError(error)))
                }

            case .failure(let err):
                completion(.failure(.onError(err)))
            }
        }
    }


}
