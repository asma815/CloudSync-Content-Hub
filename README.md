# CloudSync Content Hub

**A Flutter-based cross-platform content application with API integration and offline caching.**

## Project Overview

CloudSync Content Hub is a Flutter application that fetches posts from an online API and displays them in a clean and user-friendly interface. It also saves content locally so users can access previously loaded posts when an internet connection is unavailable.

## Features

- Fetch posts from a remote REST API.
- Display post titles, descriptions, and user IDs.
- Refresh content using the refresh button.
- Store posts locally using SharedPreferences.
- Access cached posts in offline mode.
- Automatically fetch fresh content when internet connectivity is available.
- Clean and scrollable user interface.

## Technologies Used

- Flutter
- Dart
- REST API
- HTTP package
- Provider (State Management)
- SharedPreferences (Local Storage)

## API Integration

The application uses the DummyJSON Posts API:

https://dummyjson.com/posts?limit=30

It fetches posts and displays their information in the application.

## Offline Caching

The application stores previously fetched posts locally using SharedPreferences. When the internet connection is unavailable, saved posts remain accessible. When the connection is restored, the application attempts to fetch fresh posts from the API.

## Project Structure

```text
lib/
├── models/
│   └── post.dart
├── providers/
│   └── post_provider.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── post_service.dart
└── main.dart
```

## Installation and Setup

1. Install Flutter SDK.
2. Clone or download this repository.
3. Open the project folder in VS Code.
4. Run the following commands:

```bash
flutter pub get
flutter run
```

## Testing

Run code analysis:

```bash
flutter analyze
```

Run automated tests:

```bash
flutter test
```

## Developed For

**Progree Internship – Task 3**

**Project Name:** CloudSync Content Hub
