//
//  FavoriteMoviesPresenter.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//
import Foundation
@MainActor
protocol FavoriteMoviesPresenterProtocol: ObservableObject {
    var movies: [Movie] { get }
    func removeBookmarkMovie(_ id: Int) async
    func syncBookmarkMovieList() async throws -> [Movie]
}

@MainActor
class FavoriteMoviesPresenter: FavoriteMoviesPresenterProtocol {
    var interactor: FavouriteBookmarkInteractorProtocol
    var movies: [Movie] = []

    required init(interactor: FavouriteBookmarkInteractorProtocol) {
        self.interactor = interactor
    }

    func removeBookmarkMovie(_ id: Int) async {
        try? await interactor.removeBookmarkMovie(id)
    }

    func syncBookmarkMovieList() async throws -> [Movie] {
        []
    }
}
