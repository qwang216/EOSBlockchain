//
//  APIResponseMapper.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol APIResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError>
}

extension APIResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError> {
        guard let response = apiResponse.response, 200...299 ~= response.statusCode else {
            return .failure(.statusErrorCode(apiResponse.response?.statusCode))
        }
        guard let validData = apiResponse.data else { return .failure(.data) }
        return .success(validData)
    }
}
