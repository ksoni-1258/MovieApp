//
//  PopularRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import SwiftUICore
import SwiftUI

struct PopularRouter {
    @MainActor static func createModule() -> some View {
        InfiniteScrollablePaginatedView(
            presenter: PopularPresenter(interactor: MovieInteractor()),
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            viewTitle: "Popular") { movie in
                PopularCardView(movie: movie)
            }
    }
}
