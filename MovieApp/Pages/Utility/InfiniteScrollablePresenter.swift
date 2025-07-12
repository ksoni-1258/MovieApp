//
//  InfiniteScrollablePresenterProtocol.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import Foundation


@MainActor
protocol InfiniteScrollablePresenterProtocol: ObservableObject {
    associatedtype Item: Identifiable

    var data: [Item] { get }
    var isLoading: Bool { get }

    func loadInitialPage() async
    func loadNextPageIfNeeded(currentItem: Item)
}

class InfiniteScrollableApiPresenter: InfiniteScrollablePresenterProtocol {
    @Published var data: [Movie] = []
    @Published var isLoading = false

    var currentPage = 1
    var totalPages = 10
    
    func loadInitialPage() async {
        currentPage = 1
        data.removeAll()
        await loadPage()
    }

    func loadNextPageIfNeeded(currentItem: Movie) {
        guard let index = data.firstIndex(where: { $0.id == currentItem.id }),
              index >= data.count - 5,
              !isLoading,
              currentPage <= totalPages else { return }

        Task {
            await loadPage()
        }
    }

    private func loadPage() async {
        guard !isLoading else { return }
        isLoading = true

        await updateData()

        isLoading = false
    }

    func updateData() async {
        fatalError("updateData not overriden in child classs")
    }
}
