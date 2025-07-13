//
//  DeepLinkManager.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

// MovieApp://movie?id=123
// MovieApp://favorites

import Foundation

enum DeepLinkType {
    case movie(id: Int)
    case favourite
}

class DeepLinkManager: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var selectedMovie: Int? = nil

    func handle(url: URL) {
        _ = URLComponents(url: url, resolvingAgainstBaseURL: true)
        if url.host == "movie" {
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
               let queryItem = components.queryItems?.first(where: { $0.name == "id" }),
               let movieIdString = queryItem.value,
               let movieId = Int(movieIdString) {
                    self.selectedMovie = movieId
            }
        } else if url.host == "favorites" {
            selectedTab = 3
        }
    }
}
