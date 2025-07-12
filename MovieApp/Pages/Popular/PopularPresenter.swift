//
//  PopularPresenter.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

@MainActor
class PopularPresenter: InfiniteScrollableApiPresenter {
    var interactor: MovieInteractorProtocol

    required init(interactor: MovieInteractorProtocol) {
        self.interactor = interactor
    }
    override func updateData() async {
        let endPoint = MovieEndPoints.popular(currentPage)
        if let data = try? await interactor.fetchMovies(endPoint) {
            Task { @MainActor in
                self.data += data.results
                self.currentPage += 1
                self.totalPages = data.totalPages
            }
        }
    }
}

