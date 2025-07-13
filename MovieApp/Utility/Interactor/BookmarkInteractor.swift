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
        do {
            let paginatedMovies = try await NetworkInteractor.fetchForModel(BookmarkEndPoints.getBookmarkList, type: PaginatedResult<Movie>.self)
            return paginatedMovies?.results ?? []
        } catch {
            return []
        }
    }
}
protocol BookmarkInteractorProtocol {
    func addBookmarkMovie(_ id: Int) async throws
    func removeBookmarkMovie(_ id: Int) async throws
    func syncBookmarkMovieList() async throws -> [Movie]
}
