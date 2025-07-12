//
//  MusicSearchInteractorProtocol.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation


protocol SearchInteractorProtocol {
    func fetchMovies(for query: String) async -> [Movie]
}

class SearchInteractor: SearchInteractorProtocol {
    func fetchMovies(for query: String) async -> [Movie] {
        do {
            return try JsonParser.DecodeData(type: [Movie].self, data: MovieMockData.movieList)
        } catch {
            print(error)
            return []
        }
    }
}

private struct SearchResult: Decodable {
    let results: [Movie]
}
