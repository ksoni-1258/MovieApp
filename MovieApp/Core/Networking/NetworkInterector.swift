//
//  NetworkInterector.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

nonisolated class NetworkInteractor {
    static func fetchForModel<T:Decodable>(_ endpoint: EndpointType, type: T.Type) async throws -> T? {
        if let data = try await fetchData(endpoint) {
            do {
                return try JsonParser.DecodeData(type: T.self, data: data)
            } catch {
                debugPrint("fetchForModel error: /n \(error)")
                return nil
            }
        }
        return nil
    }

    static func fetchData(_ endpoint: EndpointType) async throws -> Data? {
        do {
            return try await ApiRouter.performRequest(endpoint)
        } catch let error as RequestError {
            throw error
        } catch {
            debugPrint("fetch error: /n \(error)")
            return nil
        }
    }
}
