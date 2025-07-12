//
//  BookmarkInteractor.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//


class BookmarkInteractor: BookmarkInteractorProtocol, MovieDetailBookmarkInteractorProtocol {
    func addBookmarkMovie(_ id: Int) async throws {
        try? await NetworkInteractor.fetchData(BookmarkEndPoints.addBookmark(id))
    }
    
    func removeBookmarkMovie(_ id: Int) async throws {
        try? await NetworkInteractor.fetchData(BookmarkEndPoints.removeBookmark(id))
    }
    
    func getBookmarkMovieList() async throws {
    }
}
protocol BookmarkInteractorProtocol {
    func addBookmarkMovie(_ id: Int) async throws
    func removeBookmarkMovie(_ id: Int) async throws
    func getBookmarkMovieList() async throws
}
