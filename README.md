# CineVerse

## Movie & TV Series Discovery Platform

---

# Project Overview

CineVerse is a modern Flutter application designed for discovering, searching, and discussing movies and television series.

The application integrates external movie data from the TMDB API and combines local persistence, cloud synchronization, realtime communication, and responsive user interface design into a single platform.

The project was developed as a final team project and demonstrates practical usage of advanced Flutter development concepts, including:

- Declarative navigation
- State management
- Local databases
- Firebase services
- Networking
- Scalable application structure

The primary objective of CineVerse is to provide users with an interactive and personalized movie exploration experience while following clean and maintainable software architecture principles.

---

# Features

- User authentication with Firebase Authentication
- Trending movies and TV series from TMDB API
- Movie search with persistent search history
- Detailed movie information pages
- Local watchlist storage using Drift (SQLite)
- Realtime movie comments using Firebase Firestore
- Global realtime movie chat
- Dark and light theme support
- Responsive UI with scrollable layouts and Slivers
- Declarative navigation using go_router
- State management with Riverpod
- JSON serialization and API integration using Chopper
- Persistent application settings with SharedPreferences
- Cached movie poster loading for improved performance

---

# Application Architecture

The project follows a modular architecture inspired by Clean Architecture principles.

## Project Structure

```text
lib/
├── screens/
├── providers/
├── services/
├── api/
├── models/
├── database/
├── constants.dart
└── main.dart
```

---

## Folder Descriptions

### lib/screens/
Contains all application screens including authentication, home, search, watchlist, profile, chat, and movie details pages.

### lib/providers/
Riverpod providers for state management, theme handling, authentication, API data, and database access.

### lib/services/
Handles Firebase authentication, Firestore communication, SharedPreferences, and application logic.

### lib/api/
TMDB API integration using Chopper for networking and movie data fetching.

### lib/models/
Dart model classes for movies, comments, chat messages, and API responses.

### lib/database/
Drift SQLite database implementation for local watchlist storage.

### lib/constants.dart
Stores API URLs, image paths, and application constants.

### lib/main.dart
Application entry point with Firebase initialization, routing, providers, and theme configuration.

---

# Technologies Used

| Category | Technology |
|---|---|
| State Management | Riverpod |
| Navigation | go_router |
| Networking | Chopper, HTTP Requests, JSON Serialization |
| Local Persistence | SharedPreferences, Drift (SQLite) |
| Firebase Services | Firebase Authentication, Cloud Firestore |

---

# Setup Instructions

## 1. Clone Repository

```bash
git clone <repository-url>
```

---

## 2. Install Dependencies

```bash
flutter pub get
```

---

## 3. Configure Firebase

Add the required Firebase configuration files:

- `google-services.json`
- `firebase_options.dart`

Enable:

- Firebase Authentication
- Cloud Firestore

---

## 4. Configure TMDB API Key

Insert your TMDB API key inside:

```text
lib/constants.dart
```

---

## 5. Generate Required Files

Run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

This generates:

- Chopper files
- Drift database files
- JSON serialization code

---

## 6. Run the Application

```bash
flutter run
```

---

# Conclusion

CineVerse demonstrates the integration of modern Flutter development practices into a complete production-style application.

The project combines:

- Responsive UI design
- Realtime cloud functionality
- Structured local persistence
- Scalable application architecture

into a cohesive movie discovery platform.

The application highlights practical usage of Flutter ecosystem technologies while maintaining clean structure, responsive performance, and user-focused design.