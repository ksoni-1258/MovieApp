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
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        .clipped()
                case .failure(_):
                    Color.gray
                        .frame(height: 220)
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                case .empty:
                    ProgressView()
                        .frame(height: 220)
                @unknown default:
                    EmptyView()
                }
            }
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
