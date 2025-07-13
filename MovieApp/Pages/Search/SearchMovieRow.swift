//
//  SearchMovieRow.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//
import SwiftUI

struct SearchMovieRow: View {
    var movie: Movie

    var body: some View {
        HStack {
            CachedAsyncImageView(imageUrl: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                .clipped()

            Text(movie.title)
                .lineLimit(2)

            Spacer()
        }
    }
}
