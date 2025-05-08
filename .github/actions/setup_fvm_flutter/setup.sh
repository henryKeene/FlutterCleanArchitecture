#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-.}"

echo "Current directory: $(pwd)"
echo "Project directory: $PROJECT_DIR"
echo "Runner OS: $RUNNER_OS"

echo "Installing FVM..."

mkdir -p "$HOME/.fvm"
echo "Created FVM directory at $HOME/.fvm"

if [[ "$RUNNER_OS" == "macOS" ]]; then
  echo "Installing FVM via Homebrew..."
  brew tap leoafarias/fvm
  brew install fvm
else
  echo "Installing FVM via install script..."
  curl -fsSL https://raw.githubusercontent.com/leoafarias/fvm/main/scripts/install.sh | bash
  export PATH="$HOME/.fvm/bin:$PATH"
fi

echo "Verifying FVM installation..."
if ! command -v fvm &> /dev/null; then
  echo "Error: FVM not found in PATH"
  echo "Current PATH: $PATH"
  exit 1
fi

echo "FVM version: $(fvm --version)"

echo "Installing Flutter via FVM..."
cd "$PROJECT_DIR"
echo "Changed to directory: $(pwd)"

# Clean up any existing Flutter SDK
echo "Cleaning up existing Flutter SDK..."
rm -rf .fvm/flutter_sdk || true

# Ensure FVM is properly configured
echo "Configuring FVM..."
fvm config --cache-path "$HOME/.fvm/cache"
fvm config --flutter-sdk-path "$HOME/.fvm/flutter_sdk"

# Install Flutter using FVM
echo "Installing Flutter SDK..."
fvm install --force

# Verify Flutter SDK installation
FLUTTER_PATH="$(pwd)/.fvm/flutter_sdk"
echo "Checking Flutter SDK at: $FLUTTER_PATH"
if [ ! -d "$FLUTTER_PATH" ]; then
  echo "Error: Flutter SDK installation failed"
  echo "Checking FVM status..."
  fvm list
  echo "FVM configuration:"
  fvm config
  echo "Directory contents:"
  ls -la .fvm/
  exit 1
fi

# Add Flutter to PATH
echo "Adding Flutter to PATH..."
echo "FLUTTER_ROOT=$FLUTTER_PATH" >> $GITHUB_ENV
echo "$FLUTTER_PATH/bin" >> $GITHUB_PATH
echo "$FLUTTER_PATH/bin/cache/dart-sdk/bin" >> $GITHUB_PATH

# Verify Flutter binary
echo "Verifying Flutter binary..."
if [ -f "$FLUTTER_PATH/bin/flutter" ]; then
  echo "Flutter installation verified:"
  "$FLUTTER_PATH/bin/flutter" --version
else
  echo "Error: Flutter binary not found at $FLUTTER_PATH/bin/flutter"
  echo "FVM configuration:"
  fvm config
  echo "Directory contents of $FLUTTER_PATH:"
  ls -la "$FLUTTER_PATH"
  exit 1
fi