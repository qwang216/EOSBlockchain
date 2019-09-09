//
//  Mock_EOSManager.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class Mock_EOSManager: EOSManagerable {

    var isSuccess: Bool = true

    func getDataOnBlock(number: Int, completion: @escaping EOSResult<EOSBlockObj>) {

        guard isSuccess else {
            completion(.failure(.failedFetchBlockDetail))
            return
        }

        guard let path = Bundle.main.path(forResource: "block", ofType: "json") else {
            completion(.failure(.failedFetchBlockDetail))
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonObjc = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let validJSON = jsonObjc as? [String: Any]  else {
                completion(.failure(.failedFetchBlockDetail))
                return
            }

            let block = try EOSBlockObj(json: validJSON)
            completion(.success(block))

        } catch {
            completion(.failure(.failedFetchBlockDetail))
        }
    }


    func getRecentBlockNum(completion: @escaping EOSResult<Int>) {
        if !isSuccess {
            completion(.failure(.failedFetchRecentBlock))
        } else {
            completion(.success(123420))
        }
    }

}
