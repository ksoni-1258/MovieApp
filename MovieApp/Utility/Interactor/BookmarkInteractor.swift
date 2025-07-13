//
//  BookmarkInteractor.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

class BookmarkInteractor: BookmarkInteractorProtocol, MovieDetailBookmarkInteractorProtocol, FavouriteBookmarkInteractorProtocol {
    func addBookmarkMovie(_ id: Int) async throws {
        try? await NetworkInteractor.fetchData(BookmarkEndPoints.addBookmark(id))
    }

    func removeBookmarkMovie(_ id: Int) async throws {
        try? await NetworkInteractor.fetchData(BookmarkEndPoints.removeBookmark(id))
    }

    func syncBookmarkMovieList() async throws -> [Movie] {
        []
    }
}
protocol BookmarkInteractorProtocol {
    func addBookmarkMovie(_ id: Int) async throws
    func removeBookmarkMovie(_ id: Int) async throws
    func syncBookmarkMovieList() async throws -> [Movie]
}
