//
//  SearchInfiniteScrollablePresenterProtocol.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//

import Foundation

@MainActor
protocol SearchInfiniteScrollablePresenterProtocol: InfiniteScrollablePresenterProtocol, SearchPresenterProtocol {
}

@MainActor
protocol SearchPresenterProtocol: ObservableObject {
    associatedtype Item: Identifiable

    var data: [Item] { get set }
    var searchText: String {get set}

    func onSearchTextChanged(_ searchText: String)
}
