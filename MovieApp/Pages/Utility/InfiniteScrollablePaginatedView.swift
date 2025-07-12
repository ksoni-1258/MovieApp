//
//  InfiniteScrollablePaginatedView.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUI

struct InfiniteScrollablePaginatedView<
    P: InfiniteScrollablePresenterProtocol,
    V: View
>: View {
    @StateObject var presenter: P
    let columns: [GridItem]
    let viewTitle: String
    let content: (P.Item) -> V

    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(presenter.data) { item in
                        content(item)
                            .onAppear {
                                presenter.loadNextPageIfNeeded(currentItem: item)
                            }
                    }
                }
                .padding()
                .task {
                    await presenter.loadInitialPage()
                }

                if presenter.isLoading {
                    ProgressView()
                        .padding()
                }
            }
            .navigationTitle(viewTitle)
        } detail: {
            Text("Select a Movie")
                .font(.largeTitle)
        }
    }
}
