//
//  FavoriteMoviesView.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//
import SwiftData
import SwiftUI

struct FavoriteMoviesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var favMovieList: [FavoriteMovie]

    @StateObject var presenter: FavoriteMoviesPresenter

    var body: some View {
        NavigationView {
            List {
                ForEach(favMovieList) { favMovie in
                    FavoriteMovieRow(favMovie: favMovie)
                }
                .onDelete(perform: { indexSet in
                    Task {
                        await withTaskGroup { group in
                            for index in indexSet {
                                let favMovie = favMovieList[index]
                                await MainActor.run {
                                    modelContext.delete(favMovie)
                                }
                                group.addTask {
                                    await presenter.removeBookmarkMovie(favMovie.id)
                                }
                            }
                            for await _ in group {}
                        }
                    }
                })
            }
            .navigationTitle("Favorites")
        }
    }
}
