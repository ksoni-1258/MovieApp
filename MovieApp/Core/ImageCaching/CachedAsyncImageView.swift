//
//  CachedAsyncImageView.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//


import SwiftUI

struct CachedAsyncImageView: View {
    let imageUrl: String
    @StateObject private var loader = AsyncImageLoader()

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.load(from: imageUrl)
        }
    }
}
