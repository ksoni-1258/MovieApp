//
//  FavoriteMovieRow.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//

import SwiftUI

struct FavoriteMovieRow: View {
    var favMovie: FavoriteMovie

    var body: some View {
        HStack {
            CachedAsyncImageView(imageUrl: "https://image.tmdb.org/t/p/w500\(favMovie.posterPath ?? "")")
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                .clipped()

            Text(favMovie.title)
                .lineLimit(2)

            Spacer()
        }
    }
}
