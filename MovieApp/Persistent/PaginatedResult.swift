//
//  MoviePaginableResult.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

struct PaginatedResult<T: Codable>: Codable {
    let results: [T]
    let page: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPages = "total_pages"
    }
}
