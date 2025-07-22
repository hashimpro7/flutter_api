🧑‍💻 Flutter User Profile API App

This is a simple Flutter application that demonstrates how to fetch and display user profile data from a REST API using the `http` package.

## 📱 Features

- Fetches user data from a public API (`https://jsonplaceholder.typicode.com/users`)
- Parses JSON data and displays it in a list
- Reusable widget (`ReuseableRow`) for displaying individual user fields
- Clean and responsive UI using Flutter widgets

## 🗂️ Project Structure

lib/
├── main.dart
├── user_profile_screen.dart
└── Models


### 📄 main.dart

- Entry point of the Flutter application.
- Initializes the app and sets `UserProfileScreen` as the home widget.
- Applies a Material Theme with a purple color scheme.

### 📄 user_profile_screen.dart

- Defines a `UserProfileScreen` widget using `StatefulWidget`.
- Uses the `http` package to perform a GET request to fetch user data.
- Parses JSON and displays it in a scrollable list.
- Contains a reusable widget `ReuseableRow` for rendering key-value user fields like name, username, email, and location.

## 🔌 API Used

- **Endpoint**: `https://jsonplaceholder.typicode.com/users`
- This is a free fake REST API for testing and prototyping.
