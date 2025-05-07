# Flutter Monorepo Management with Melos 7 and CI/CD Pipelines

This project uses Melos 7.0.0 and Dart Workspaces for efficient monorepo management, along with GitHub Actions for CI/CD pipelines. This document explains how to work with this setup.

## Project Structure

The project follows a multi-package architecture:

```
FlutterCleanArchitecture/
├── packages/
│   ├── app/
│   │   ├── starter_app/     # Main application
│   │   └── navigation/      # Navigation package
│   ├── features/            # Feature packages
│   │   ├── contact/
│   │   ├── dashboard/
│   │   ├── login_signup/
│   │   ├── munro_list/
│   │   ├── offline/
│   │   ├── settings/
│   │   └── team/
│   └── core/               # Core utility packages
│       ├── core_logging/
│       ├── core_theme/
│       ├── core_authentication/
│       ├── core_munros_data/
│       └── core_analytics/
├── pubspec.yaml           # Root workspace configuration
├── pubspec.lock           # Single lock file for the workspace
└── .github/               # CI/CD workflows
    └── workflows/         # GitHub Actions workflow files
```

## Melos 7 Setup

This project uses [Melos 7.0.0](https://pub.dev/packages/melos/versions/7.0.0) with native [Dart Workspaces](https://dart.dev/tools/pub/workspaces) for dependency management.

### Key Benefits

- **Native Dart Integration**: Uses Dart's built-in workspace feature for more reliable dependency resolution
- **Single Version Management**: Manages a single application version for the entire monorepo
- **Unified Changelog**: Generates an aggregated changelog for all packages
- **Efficient CI/CD**: Optimizes CI pipelines by only building and testing affected packages

### Getting Started

1. Install Melos globally:
   ```bash
   dart pub global activate melos
   ```

2. Bootstrap the workspace (only needed once after cloning):
   ```bash
   dart pub get
   ```

3. Run scripts across all packages:
   ```bash
   melos run <script-name>
   ```

### Available Scripts

- `melos run analyze` - Run Flutter analyze in all packages
- `melos run test` - Run tests in all packages with tests
- `melos run test:diff` - Run tests only on packages changed since the main branch
- `melos run build_runner:all` - Run build_runner in all packages
- `melos run build_runner:diff` - Run build_runner only on changed packages
- `melos run format` - Run Dart format in all packages

## Versioning and Changelog

The monorepo uses a single application version and generates an aggregated changelog:

1. Versioning is based on [Conventional Commits](https://www.conventionalcommits.org/)
2. The single application version is tracked in `packages/app/starter_app/pubspec.yaml`
3. GitHub Actions creates a single Git tag for the entire application (e.g., `v1.0.0`)

## CI/CD Pipelines

GitHub Actions workflows automate testing, building, and releasing:

### PR Checks
- Triggered on PRs to `develop`, `release-candidate`, or `main`
- Runs analysis and tests only on changed packages (for efficiency)

### Development Build (Alpha)
- Triggered on pushes to `develop`
- Runs all tests and builds the alpha version

### Release Candidate Build (Beta) 
- Triggered on pushes to `release-candidate`
- Runs all tests and builds the beta version

### Production Release
- Triggered on pushes to `main`
- Runs all tests, updates versions, generates changelog
- Creates Git tag and GitHub release
- Builds the production version

## Flavors

The application supports multiple flavors:

- **Alpha**: For development builds (from `develop` branch)
- **Beta**: For pre-release testing (from `release-candidate` branch)
- **Live**: For production releases (from `main` branch)

## Development Workflow

1. Create feature branches from `develop`
2. Open PRs targeting `develop`
3. Merges to `develop` trigger alpha builds
4. PRs from `develop` to `release-candidate` trigger beta builds
5. PRs from `release-candidate` to `main` trigger production releases 