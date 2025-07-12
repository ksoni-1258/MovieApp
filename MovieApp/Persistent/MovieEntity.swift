//
//  MovieEntity.swift
//  MovieApp
//
//  Created by Kishan Soni on 02/07/25.
//

import SwiftData

//@Model
struct MovieEntity: Codable {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String
    var backdropPath: String
    var voteAverage: Double
    var releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }

    private init(
        id: Int,
        title: String,
        overview: String,
        posterPath: String,
        backdropPath: String,
        voteAverage: Double,
        releaseDate: String
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
    }

//    required convenience init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let id = try container.decode(Int.self, forKey: .id)
//        let title = try container.decode(String.self, forKey: .title)
//        let overview = try container.decode(String.self, forKey: .overview)
//        let posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
//        let backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
//        let voteAverage = try container.decode(Double.self, forKey: .voteAverage)
//        let releaseDate = try container.decode(String.self, forKey: .releaseDate)
//
//        self.init(
//            id: id,
//            title: title,
//            overview: overview,
//            posterPath: posterPath,
//            backdropPath: backdropPath,
//            voteAverage: voteAverage,
//            releaseDate: releaseDate
//        )
//    }
}
