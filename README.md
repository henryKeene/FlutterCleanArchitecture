# Clean Architecture Demo

A Flutter demonstration project showcasing a modern, scalable architecture using a package-based approach. This project serves as a reference implementation for building large-scale Flutter applications with clean architecture principles.

## 🎯 Project Goals

- Demonstrate a scalable package-based project structure
- Implement clean architecture with clear separation of concerns
- Showcase functional programming paradigms using `fpdart`
- Illustrate advanced navigation patterns using `flow_builder` and `go_router`
- Provide real-world examples of dependency injection using `get_it` and `injectable`
- Implement comprehensive testing practices
- Demonstrate offline-first capabilities
- Show proper state management using `flutter_bloc`
- Using Flutters in-built themeing to the best of its ability


## 🏛️ Architecture Overview

### Package-Based Structure

The project follows a modular architecture with three main package types:

- **Core Packages**: Fundamental services and utilities
- **Feature Packages**: Self-contained business features
- **App Packages**: Application-specific implementation and configuration

### Navigation

- Uses `go_router` for declarative routing
- Implements `flow_builder` for complex flow management
- Supports deep linking and nested navigation

### State Management

- Utilizes `flutter_bloc` for predictable state management
- Implements functional error handling using `fpdart`
- Supports offline-first architecture with proper state persistence

### Dependency Injection

- Uses `get_it` as service locator
- Implements `injectable` for automated dependency injection
- Maintains clean architecture boundaries


### Still to do 🫵

- Implement testing with bdd testing 
- Improve and add more Melos scripts
- Internationalisation per package 
- Mason brick for feature packages



