# MandalaHearts

A Flutter social app focused on community engagement, user profiles, spiritual content, and post sharing.

## Overview

MandalaHearts is a mobile-first application built to support:

- user sign-in and account management
- profile creation and customization
- creating and viewing posts
- social feed interaction
- spiritual master discovery and content access
- app configuration and remote updates

## Tech Stack

- Flutter
- Dart
- Firebase Authentication + Firestore + Remote Config
- Supabase for media/storage
- BLoC for state management
- Go Router for navigation
- Shared preferences and app configuration services

## Architecture

The app follows a clean feature-based structure with a layered architecture:

- Features: separate modules such as auth, profile, feed, posts, and onboarding
- BLoC: handles UI state and business logic inside each feature
- Repository layer: abstracts data access and keeps screens independent from storage logic
- Services: Firebase and Supabase integrations are isolated for easier maintenance
- App config and environment setup: managed separately for scaling and deployment

This keeps the project easy to extend as new features are added.

## Project Structure

- lib/features: feature-based screens and BLoC logic
- lib/repository: repository classes for app data access
- lib/core: shared utilities, services, validators, and widgets
- lib/models: app data models
- lib/screens: app screens and navigation entry points


## Getting Started

```bash
flutter pub get
flutter run
```

Make sure Firebase and Supabase environment values are configured before running the app.
