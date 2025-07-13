//
//  NowPlayingCardView.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUI

struct NowPlayingCardView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 4) {
            CachedAsyncImageView(imageUrl: "https://image.tmdb.org/t/p/w500\(movie.backdropPath ?? "")")
                .frame(height: 220)
                .clipped()
                .cornerRadius(8)
                .padding(8)

            VStack (alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(1)

                    Spacer()
                    
                    if let voteAverage = movie.voteAverage, let releaseDate = movie.releaseDate {
                        Text(String(format: "%.2f", voteAverage))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)

                        Text(" | \(releaseDate)")
                            .font(.caption2)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    
                }

                Text(movie.overview)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .lineLimit(3)

            }
            
            Spacer()
            
            Divider()
                .background(Color.gray.opacity(0.3))
        }
        .cornerRadius(8)
    }
}
