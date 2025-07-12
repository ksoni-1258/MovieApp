//
//  MovieEntity.swift
//  MovieApp
//
//  Created by Kishan Soni on 02/07/25.
//

struct Movie: Codable, Identifiable {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var backdropPath: String?
    var voteAverage: Double?
    var releaseDate: String?

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
}
