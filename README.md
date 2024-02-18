# Discovery App

This Flutter application displays a list of discovery items fetched from an API. It implements pagination and infinite scrolling to load more items as the user scrolls through the list.

## Table of Contents

- [Dependencies](#dependencies)
- [Features](#features)
- [How to Use](#how-to-use)


## Dependencies

- Flutter: Used to build the mobile application.
- GetX: State management library for Flutter.
- Shimmer: Package for adding shimmer loading effect.
- Connectivity Plus: Package for checking internet connectivity.

## Features

- Displays a list of discovery items fetched from an API.
- Supports pagination and infinite scrolling to load more items.
- Shows a shimmer loading effect while loading more items.
- Handles network failures gracefully by displaying a snackbar when the internet connection is lost.

## How to Use
- Clone the repository:
  git clone https://github.com/Ankit180898/discovery.git

- Navigate to the project directory:
  cd discovery

- Run the app:
  flutter run