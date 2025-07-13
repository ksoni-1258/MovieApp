//
//  FavouriteBookmarkInteractor.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//

protocol FavouriteBookmarkInteractorProtocol {
    func removeBookmarkMovie(_ id: Int) async throws
    func syncBookmarkMovieList() async throws -> [Movie]
}
