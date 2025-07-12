//
//  SearchInfiniteScrollablePaginatedView.swift
//  MovieApp
//
//  Created by Kishan Soni on 12/07/25.
//
import SwiftUI

struct SearchInfiniteScrollablePaginatedView<
    P: SearchInfiniteScrollablePresenterProtocol,
    V: View,
    D: View
>: View {
    @State private var searchText = ""
    @StateObject var presenter: P
    @State private var selectedItem: P.Item?

    let columns: [GridItem]
    let viewTitle: String
    let content: (P.Item) -> V
    let detailView: (P.Item) -> D

    var body: some View {
        NavigationView {
            VStack{
            TextField("Search", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onChange(of: searchText) {
                    presenter.onSearchTextChanged(searchText)
                }
            
            if presenter.data.isEmpty && !searchText.isEmpty {
                Spacer()
                Text("No results found")
                    .foregroundColor(.gray)
                Spacer()
            } else {
                List(presenter.data) { item in
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
        }
        .navigationTitle(viewTitle)
        .sheet(item: $selectedItem) { item in
                detailView(item)
            }
        }
    }
}
