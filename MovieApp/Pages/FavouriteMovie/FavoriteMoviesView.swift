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
            .refreshable(action: {
                Task {
                    await syncFavorites()
                }
            })
            .navigationTitle("Favorites")
            .task {
                await syncFavorites()
            }
        }
    }

    @MainActor
    private func syncFavorites() async {
        do {
            let updatedMovies = try await presenter.syncBookmarkMovieList()
            await MainActor.run {
                // Remove existing ones
                for movie in favMovieList {
                    modelContext.delete(movie)
                }

                // Add new fetched movies
                for movie in updatedMovies {
                    modelContext.insert(movie)
                }
            }
        } catch {
            debugPrint(error)
        }
    }
}
