//
//  FavoriteMoviesRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//


import SwiftUI

struct FavoriteMoviesRouter {
    @MainActor
    static func createModule() -> some View {
        FavoriteMoviesView(
            presenter: FavoriteMoviesPresenter(
                interactor: BookmarkInteractor()
            )
        )
    }
}
