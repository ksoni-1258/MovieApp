//
//  MusicSearchPresenterProtocol.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

class SearchPresenter: InfiniteScrollableApiPresenter, SearchPresenterProtocol {
    var interactor: MovieInteractorProtocol

    private var searchWorkItem: DispatchWorkItem?

    required init(interactor: MovieInteractorProtocol) {
        self.interactor = interactor
    }
    var searchText: String = ""

    override func updateData() async {
        guard searchText.count > 1 else {
            return
        }
        let queryList: QueryList = [
            URLQueryItem(name: "query", value: searchText)
        ]
        
        let endPoint = MovieEndPoints.search(queryList, currentPage)
        if let data = try? await interactor.fetchMovies(endPoint) {
            Task { @MainActor in
                self.data += data.results
                self.currentPage += 1
                self.totalPages = data.totalPages
            }
        }
    }
}
extension SearchPresenter {
    func onSearchTextChanged(_ text: String) {
        searchWorkItem?.cancel()
        searchText = text
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty, text.count > 1 else {
            self.data = []
            return
        }

        let workItem = DispatchWorkItem { [weak self] in
            self?.data = []
            self?.currentPage = 1
            Task {
                await self?.updateData()
            }
        }

        self.searchWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: workItem)
    }
}
