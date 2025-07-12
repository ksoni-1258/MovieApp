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
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                case .failure(_):
                    Color.gray
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 70, height: 70)
            .cornerRadius(8)

            Text(movie.title)
                .lineLimit(1)

            Spacer()
        }
    }
}
