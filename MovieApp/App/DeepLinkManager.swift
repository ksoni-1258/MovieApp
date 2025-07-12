//
//  DeepLinkManager.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

enum DeepLinkType {
    case movie(id: Int)
    case profile
}

class DeepLinkManager {
    static let shared = DeepLinkManager()

    func handle(url: URL) -> DeepLinkType? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let host = components?.host else { return nil }

        if host == "movie", let id = Int(components?.queryItems?.first(where: { $0.name == "id" })?.value ?? "") {
            return .movie(id: id)
        } else if host == "profile" {
            return .profile
        }
        return nil
    }
}
