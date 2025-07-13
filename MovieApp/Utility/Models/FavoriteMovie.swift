//
//  FavoriteMovie.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//

import SwiftData

@Model
class FavoriteMovie {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var backdropPath: String?
    var voteAverage: Double?
    var releaseDate: String?

    init(
        id: Int,
        title: String,
        overview: String,
        posterPath: String? = nil,
        backdropPath: String? = nil,
        voteAverage: Double? = nil,
        releaseDate: String? = nil
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
    }

    init(_ movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.posterPath = movie.posterPath
        self.backdropPath = movie.backdropPath
        self.voteAverage = movie.voteAverage
        self.releaseDate = movie.releaseDate
    }
}
