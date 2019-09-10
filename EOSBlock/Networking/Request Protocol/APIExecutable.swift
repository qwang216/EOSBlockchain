//
//  APIExecutable.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol APIExecutable: APIResponseMapper {
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var relativePath: String { get }
    var body: JSON? { get }
    var header: HTTPHeader? { get }
    var cacheKey: String? { get }
    func execute(session: URLSession, completion: @escaping EOSResultClosure<Data, APIError>)
}

extension APIExecutable {

    var relativePath: String {
        return ""
    }

    var absolutePath: String {
        return baseURL + relativePath
    }

    var baseURL: String {
        return config.eosNYBaseURL
    }

    var method: HTTPMethod {
        return .GET
    }

    var body: JSON? {
        return nil
    }

    var header: HTTPHeader? {
        return nil
    }

    var cacheKey: String? {
        return nil
    }

    func execute(session: URLSession = .shared, completion: @escaping EOSResultClosure<Data, APIError>) {
        guard let url = URL(string: absolutePath) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header

        if let body = body {
            do {
                let dataBody = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = dataBody
            }
            catch {
                completion(.failure(.invalid("Request Body JSONSerialization Error: \(error.localizedDescription)")))
            }
        }

        session.dataTask(with: request) { (data, response, err) in
            let resultResponse = self.parseHTTPReponse((data, (response as? HTTPURLResponse), err))
            completion(resultResponse)
            }.resume()

    }
}
