//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Kishan Soni on 02/07/25.
//

import SwiftData
import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PopularRouter.createModule().tabItem { Label("Popular", systemImage: "star") }
                NowPlayingRouter.createModule().tabItem { Label("Now Playing", systemImage: "flame.fill") }
                SearchRouter.createModule().tabItem { Label("Search", systemImage: "magnifyingglass") }
                FavoriteMoviesRouter.createModule().tabItem({ Label("Favourite", systemImage: "heart.fill")})
            }
            .modelContainer(for: [FavoriteMovie.self])
            .tint(.red)
            .preferredColorScheme(.dark)
        }
    }
}

let sharedModelContainer: ModelContainer = {
    let schema = Schema([FavoriteMovie.self])
    let config = ModelConfiguration("FavoriteMovieDB")
    return try! ModelContainer(for: schema, configurations: [config])
}()
