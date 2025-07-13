//
//  PopularView.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import SwiftUI

struct PopularCardView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            CachedAsyncImageView(imageUrl: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")
                .frame(height: 220)
                .clipped()
                .cornerRadius(8)

            Text(movie.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
        .padding(6)
        .cornerRadius(8)
    }
}
