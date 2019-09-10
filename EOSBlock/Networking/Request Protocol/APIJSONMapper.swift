//
//  APIJSONMapper.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol APIJSONMapper {
    static func serializeJSON(_ data: Data) -> Result<JSON, APIError>
    func mapExecuteRequest(force: Bool, onCompletion: @escaping EOSResultClosure<JSON, APIError>)
}

extension APIJSONMapper where Self: APIExecutable {

    func mapExecuteRequest(force: Bool = false, onCompletion: @escaping EOSResultClosure<JSON, APIError>) {
        execute { (result) in
            switch result {
            case .success(let data):
                onCompletion(Self.serializeJSON(data))
            case .failure(let err):
                onCompletion(.failure(err))
            }
        }
    }


    static func serializeJSON(_ data: Data) -> Result<JSON, APIError> {
        do {
            guard let dataObject = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {
                return . failure(.invalid("JSONSerialization cannot be cast as JSON"))
            }
            return .success(dataObject)
        } catch {
            return .failure(.jsonSerialization)
        }
    }


}
