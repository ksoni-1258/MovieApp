# 🎥 MovieApp - iOS Application

A fully native iOS application built from scratch as per the "iOS Developer Task" requirements. This app leverages **Swift**, **SwiftUI**, **SwiftData**, **URLSession**, and implements a clean **VIPER architecture** to offer modularity, testability, and maintainability.

---

## ✨ Features Implemented

### 🏠 Home Tab

- Displays **Trending Movies** and **Now Playing Movies** from TMDB API
- Built using `InfiniteScrollPaginatedView` for efficient pagination
- Infinite scrolling and dynamic data loading supported

### 🎬 Movie Details View

- Tappable movie tiles navigate to a detailed screen
- Displays information like poster, title, overview, rating, etc.

### ⭐ Bookmark Feature

- Users can **bookmark/unbookmark** any movie
- Saved movies displayed on a **Favorites screen**
- Local persistence managed using **SwiftData** (modern Core Data abstraction)

### 🔍 Search Tab

- Users can search for any movie
- Includes **debounced network calls** for dynamic result updates while typing
- Paginated and infinitely scrollable results

### 🌐 Offline Support

- API responses are cached locally using **SwiftData**
- Offline access to previously loaded movies and bookmarks

### 🔗 VIPER Architecture

- Clean separation of concerns:
  - **View**: SwiftUI screens
  - **Interactor**: Business logic + API & DB handling
  - **Presenter**: Formats data for views
  - **Entity**: Movie models
  - **Router**: Navigation management
- Makes the app scalable and testable

### 📁 Image Caching

- Custom **NSCache-based LRU image cache**
- Manual expiration and memory-aware limits
- Caches images by `imageURL`

### 🔗 Deep Linking (Dummy)

- Clicking a shared link opens a specific movie directly (simulated)

### ⏱ Cache Expiry

- Manual cache expiry implemented for images and API results

---

## ⚠️ Features Not Implemented

- Actual **universal deep linking** (e.g., via URL schemes or Universal Links)
- Advanced offline strategies (e.g., background sync or Reachability checks)
- UI/UX enhancements beyond a basic yet clean layout
- UI Tests and Unit Tests

---

## 🚀 Getting Started

### Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

### Setup

1. Clone the repo or unzip the provided project
2. Open `MovieApp.xcodeproj`
3. Run on a simulator or real device

> ⚡ **Note**: You must add your TMDB API key in `APIConstants.swift`

```swift
struct APIConstants {
    static let apiKey = "YOUR_API_KEY"
}
```

---

## 📊 Dependencies Used

- No third-party libraries. 100% native Swift, SwiftUI, and SwiftData
- LRU cache written from scratch using NSCache

---

## 🖌️ Author

**Kishan Soni**\
Built as part of the iOS Developer Task

---

## 🌐 Resources

- [TMDB API Docs](https://developers.themoviedb.org/3)

---

## ⚖️ License

This project is intended for private evaluation and is **not to be made public** as per task instructions.

