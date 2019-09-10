//
//  APIDecodableMapper.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol APIDecodableMapper: DecodableObject {
    func mapExecuteRequest<T: Decodable>(objectType: T.Type, force: Bool, onCompletion: @escaping (Result<T, APIError>) -> Void)
}

extension APIDecodableMapper where Self: APIExecutable {

    func mapExecuteRequest<T: Decodable>(objectType: T.Type, force: Bool = false, onCompletion: @escaping (Result<T, APIError>) -> Void) {
        execute { (result) in
            switch result {
            case .success(let data):
                onCompletion(Self.decode(objectType, from: data))
            case .failure(let err):
                onCompletion(.failure(err))
            }
        }
    }

}
