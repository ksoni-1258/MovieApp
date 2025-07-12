//
//  PopularInteractor.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

protocol MovieInteractorProtocol {
    func fetchMovies(_ endpoint: EndpointType) async throws -> PaginatedResult<Movie>?
}

class MovieInteractor: MovieInteractorProtocol {
    func fetchMovies(_ endpoint: EndpointType) async throws -> PaginatedResult<Movie>? {
        do {
            return try await NetworkInteractor.fetchForModel(endpoint, type: PaginatedResult<Movie>.self)
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
