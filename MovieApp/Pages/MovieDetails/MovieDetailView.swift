//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUI

struct MovieDetailView: View {
    @State var movie: Movie
    @State var isBookmarked: Bool = false
    var presenter: MovieDetailPresenterProtocol

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let posterPath = movie.posterPath {
                    let fullUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"
                    CachedAsyncImageView(imageUrl: fullUrl)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)

                }

                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)

                VStack(alignment: .leading, spacing: 4) {
                    if let date = movie.releaseDate {
                        Text("Release Date: \(date)")
                    }

                    if let rating = movie.voteAverage {
                        Text("Rating: \(String(format: "%.1f", rating))/10")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Text(movie.overview)
                    .font(.body)
                    .lineSpacing(5)

                Spacer()

                if !isBookmarked {
                    Button(action: {
                        isBookmarked.toggle()
                        Task{
                            await presenter.bookmarkMovie(movie.id)
                        }
                    }) {
                        AFButton(title: "Bookmark")
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Movie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
