//
//  MovieDetailPresenter.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//
import Foundation

@MainActor
class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var interactor: MovieDetailBookmarkInteractorProtocol

    required init(interactor: MovieDetailBookmarkInteractorProtocol) {
        self.interactor = interactor
    }
    func bookmarkMovie(_ id: Int) async {
        try? await interactor.addBookmarkMovie(id)
    }
}

protocol MovieDetailPresenterProtocol {
    func bookmarkMovie(_ id: Int) async
}
