//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Kishan Soni on 02/07/25.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PopularRouter.createModule().tabItem { Label("Popular", systemImage: "star") }
                NowPlayingRouter.createModule().tabItem { Label("Now Playing", systemImage: "flame.fill") }
                SearchRouter.createModule().tabItem { Label("Search", systemImage: "magnifyingglass") }
//                ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
            }
            .tint(.red)
            .preferredColorScheme(.dark)
        }
    }
}
