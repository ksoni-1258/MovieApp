//
//  MusicSearchView.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//


import SwiftUI

struct SearchInfiniteScrollablePaginatedView<
    P: SearchInfiniteScrollablePresenterProtocol,
    V: View
>: View {
    @State private var searchText = ""
    @StateObject var presenter: P

    let columns: [GridItem]
    let viewTitle: String
    let content: (P.Item) -> V

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
                List(presenter.data) { data in
                    HStack {
                        content(data)
                    }
                }
            }
        }
        .navigationTitle(viewTitle)
        }
    }
}


struct SearchMovieRow: View {
    var movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                case .failure(_):
                    Color.gray
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 70, height: 70)
            .cornerRadius(8)

            Text(movie.title)
                .lineLimit(1)

            Spacer()
        }
    }
}
@MainActor
protocol SearchInfiniteScrollablePresenterProtocol: ObservableObject {
    associatedtype Item: Identifiable

    var data: [Item] { get }
    var isLoading: Bool { get }
    var searchText: String {get set}

    func loadInitialPage() async
    func loadNextPageIfNeeded(currentItem: Item)
    func onSearchTextChanged(_ searchText: String)
}
