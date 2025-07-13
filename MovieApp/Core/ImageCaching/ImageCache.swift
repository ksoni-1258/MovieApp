//
//  ImageCache.swift
//  MovieApp
//
//  Created by Kishan Soni on 13/07/25.
//


import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()
    private var accessLog = [String: Date]()
    private var expiryMap = [String: Date]()
    private let queue = DispatchQueue(label: "com.app.imageCache", attributes: .concurrent)

    private let maxCacheSize = 50 // Max number of images
    private let expiryInterval: TimeInterval = 60 * 5 // 5 minutes

    private init() {
        cache.countLimit = maxCacheSize
    }

    func image(forKey key: String) -> UIImage? {
        queue.sync {
            guard let expiry = expiryMap[key], expiry > Date() else {
                // expired or not found
                remove(key: key)
                return nil
            }

            accessLog[key] = Date()
            return cache.object(forKey: key as NSString)
        }
    }

    func insertImage(_ image: UIImage, forKey key: String) {
        queue.async(flags: .barrier) {
            self.cache.setObject(image, forKey: key as NSString)
            self.expiryMap[key] = Date().addingTimeInterval(self.expiryInterval)
            self.accessLog[key] = Date()

            self.cleanupIfNeeded()
        }
    }

    private func remove(key: String) {
        cache.removeObject(forKey: key as NSString)
        accessLog.removeValue(forKey: key)
        expiryMap.removeValue(forKey: key)
    }

    private func cleanupIfNeeded() {
        // Remove expired items
        let now = Date()
        for (key, expiry) in expiryMap where expiry < now {
            remove(key: key)
        }

        // If over size, remove least recently used
        if accessLog.count > maxCacheSize {
            let sorted = accessLog.sorted { $0.value < $1.value }
            let excessCount = accessLog.count - maxCacheSize
            for i in 0..<excessCount {
                remove(key: sorted[i].key)
            }
        }
    }
}
