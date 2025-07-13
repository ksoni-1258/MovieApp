//
//  ApiRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//

import Foundation

nonisolated class ApiRouter {
    static func performRequest(_ endpoint: EndpointType) async throws -> Data {
        let urlRequest = try getUrlRequest(endpoint)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
        guard let httpResponse = response as? HTTPURLResponse else {
           throw NSError(domain: "Unable to parse response as HTTPURLResponse", code: 0)
        }
        switch httpResponse.statusCode {
        case 200...299:
            return data

        case 401:
            throw RequestError.invalidToken

        case 403:
            throw RequestError.logInRequired

        default:
            throw NSError(domain: "\(httpResponse.description)", code: httpResponse.statusCode)
        }
    }

    private static func getUrlRequest(_ route: EndpointType) throws -> URLRequest {
        do {
            guard var url = URL(string: route.baseURL.rawValue + "/" + route.path) else {
                throw NSError(domain: "URL generation error", code: 0)
            }
            if let queryParams = route.paramsBodyHeader.params {
                url.append(queryItems: queryParams)
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = route.httpMethod.rawValue
            if let bodyDict = route.paramsBodyHeader.bodyDict {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyDict, options: [])
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.allHTTPHeaderFields = route.paramsBodyHeader.headers
            return urlRequest
        } catch {
            throw error
        }
    }
}

enum RequestError: Error {
    case invalidToken
    case logInRequired
    case fileNotFound
}
