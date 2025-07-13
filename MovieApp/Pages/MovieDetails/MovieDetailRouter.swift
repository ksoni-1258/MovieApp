//
//  MovieDetailRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUI

struct MovieDetailRouter {
    @MainActor
    static func createModule(movie: Movie) -> some View {
        MovieDetailView(
            movie: movie,
            presenter: MovieDetailPresenter(
                interactor: BookmarkInteractor()
            )
        )
    }
}
