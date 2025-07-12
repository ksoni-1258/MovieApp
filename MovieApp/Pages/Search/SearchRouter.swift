//
//  MusicSearchRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import SwiftUICore
import SwiftUI

struct SearchRouter {
    @MainActor static func createModule() -> some View {
        SearchInfiniteScrollablePaginatedView(
            presenter: SearchPresenter(interactor: MovieInteractor()),
            columns: [
                GridItem(.flexible()),
            ],
            viewTitle: "Search") { movie in
                SearchMovieRow(movie: movie)
            }
    }
}
