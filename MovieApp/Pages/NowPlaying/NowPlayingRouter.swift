//
//  NowPlayingRouter.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//



import SwiftUICore
import SwiftUI

struct NowPlayingRouter {
    @MainActor static func createModule() -> some View {
        InfiniteScrollablePaginatedView(
            presenter: NowPlayingPresenter(interactor: MovieInteractor()),
            columns: [
                GridItem(.flexible())
            ],
            viewTitle: "Now Playing") { movie in
                NowPlayingCardView(movie: movie)
            }
    }
}
