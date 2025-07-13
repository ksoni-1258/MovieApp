//
//  AsyncImageLoader.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//


import SwiftUI

@MainActor
class AsyncImageLoader: ObservableObject {
    @Published var image: UIImage?

    func load(from urlString: String) {
        if let cached = ImageCache.shared.image(forKey: urlString) {
            self.image = cached
            return
        }

        guard let url = URL(string: urlString) else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let img = UIImage(data: data) {
                    ImageCache.shared.insertImage(img, forKey: urlString)
                    self.image = img
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }
}
