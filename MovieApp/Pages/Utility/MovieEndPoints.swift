//
//  MovieEndPoints.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

enum MovieEndPoints {
    case popular(Int)
    case nowPlaying(Int)
    case search(QueryList, Int)
}

extension MovieEndPoints: EndpointType {
    var baseURL: BaseUrl {
        .baseURL
    }

    var path: String {
        switch self {
        case .popular(let page):
            return "movie/popular?language=en-US&page=\(page)"

        case .nowPlaying(let page):
            return "movie/now_playing?language=en-US&page=\(page)"

        case .search(_, let page):
            return "search/movie?language=en-US&page=\(page)"
        }
    }

    var httpMethod: HttpMethodType {
        .get
    }

    var paramsAndHeader: ParameterList {
        let authKey: String = (try? AuthManager.getSessionToken()) ?? ""
        switch self {
        case .popular, .nowPlaying:
            return ParameterList(
                queryItems: nil,
                headers: [
                    "Authorization" : authKey
                ]
            )

        case .search(let queryItems, _):
            return ParameterList(queryItems: queryItems, headers: [
                "Authorization" : authKey
            ])
        }
    }
}
