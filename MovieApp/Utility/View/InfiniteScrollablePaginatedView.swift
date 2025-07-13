//
//  InfiniteScrollablePaginatedView.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import SwiftUI

struct InfiniteScrollablePaginatedView<
    P: InfiniteScrollablePresenterProtocol,
    V: View,
    D: View
>: View {
    @StateObject var presenter: P
    @State private var selectedItem: P.Item?

    let columns: [GridItem]
    let viewTitle: String
    let content: (P.Item) -> V
    let detailView: (P.Item) -> D

    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(presenter.data) { item in
                        Button {
                            selectedItem = item
                        } label: {
                            content(item)
                        }
                        .buttonStyle(.plain)
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
            .sheet(item: $selectedItem) { item in
                detailView(item)
            }
        } detail: {
            Text("Select a Movie")
                .font(.largeTitle)
        }
    }
}
