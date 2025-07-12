//
//  BookmarkEndPoints.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//


enum BookmarkEndPoints {
    case addBookmark(Int)
    case removeBookmark(Int)
//    case getBookmarkList(QueryList, Int)
}
extension BookmarkEndPoints: EndpointType {
    var baseURL: BaseUrl {
        .baseURL
    }

    var path: String {
        switch self {
        case .addBookmark, .removeBookmark:
            "account/22087278/favorite"
        }
    }

    var httpMethod: HttpMethodType {
        switch self {
        case .addBookmark, .removeBookmark:
            return .post
        }
    }

    var paramsBodyHeader: ParamBodyHeaderList {
        let authKey: String = (try? AuthManager.getSessionToken()) ?? ""
        var bodyDict: [String: Any] = [
            "media_type": "movie",
        ]

        switch self {
        case .addBookmark(let id):
            bodyDict["media_id"] = id
            bodyDict["favorite"] = true

        case .removeBookmark(let id):
            bodyDict["media_id"] = id
            bodyDict["favorite"] = false
        }

        return (
            params: nil,
            bodyDict: bodyDict,
            headers: [
                "Authorization" : authKey
            ]
        )
    }
}
