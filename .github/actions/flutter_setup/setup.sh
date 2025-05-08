#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-.}"

echo "Installing FVM..."

mkdir -p "$HOME/.fvm"

if [[ "$RUNNER_OS" == "macOS" ]]; then
  brew tap leoafarias/fvm
  brew install fvm
else
  curl -fsSL https://raw.githubusercontent.com/leoafarias/fvm/main/scripts/install.sh | bash
  export PATH="$HOME/.fvm/bin:$PATH"
fi

if ! command -v fvm &> /dev/null; then
  echo "Error: FVM not found in PATH"
  exit 1
fi

echo "Installing Flutter via FVM..."
cd "$PROJECT_DIR"
rm -rf .fvm/flutter_sdk || true
fvm install

FLUTTER_PATH="$(pwd)/.fvm/flutter_sdk"
if [ ! -d "$FLUTTER_PATH" ]; then
  echo "Error: Flutter SDK installation failed"
  exit 1
fi

echo "FLUTTER_ROOT=$FLUTTER_PATH" >> $GITHUB_ENV
echo "$FLUTTER_PATH/bin" >> $GITHUB_PATH
echo "$FLUTTER_PATH/bin/cache/dart-sdk/bin" >> $GITHUB_PATH

if [ -f "$FLUTTER_PATH/bin/flutter" ]; then
  "$FLUTTER_PATH/bin/flutter" --version
else
  echo "Error: Flutter binary not found at $FLUTTER_PATH/bin/flutter"
  exit 1
fi