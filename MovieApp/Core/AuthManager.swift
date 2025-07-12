//
//  AuthManager.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//


class AuthManager {
    private static let apiKey: String = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNjBiODUzZTI1Zjc0MThlNWNiNTRkYTU4NmM5NDZiNSIsIm5iZiI6MTc1MDMyMTIwNi4wNzYsInN1YiI6IjY4NTNjODM2ZDk1NDcwZTk4NGQ4MTk4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iy64Xt_EF7ydqeQT6qNCMFcfgil7ADkM_AbJXyIaK_I"

    static func getSessionToken() throws -> String {
        Self.apiKey // handle Keychain and token management strategies here
    }
}
