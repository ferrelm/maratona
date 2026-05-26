#!/usr/bin/env bash
# Create a clean .tar.xz archive of the current project, excluding generated files and dependencies.
# Usage: ./create_clean_tar.sh

set -euo pipefail

# This copy lives at repository root; use its directory as project root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
cd "$PROJECT_ROOT"


# Get version from pom.xml
VERSION=$(grep -m 1 '<version>' "$PROJECT_ROOT/pom.xml" | sed -E 's/.*<version>([^<]+)<\/version>.*/\1/')

DUMPS_DIR="$PROJECT_ROOT/dumps"
mkdir -p "$DUMPS_DIR"

# Detect project name from project root directory
PROJECT_NAME=$(basename "$PROJECT_ROOT")

# Compose archive name using detected project name (xz compression)
ARCHIVE_NAME="$DUMPS_DIR/${PROJECT_NAME}-clean-${VERSION}-$(date +%Y%m%d%H%M).tar.xz"

# Exclude patterns
EXCLUDES=(
  --exclude='**/node_modules'
  --exclude='**/target'
  --exclude='**/dist'
  --exclude='**/build'
  --exclude='**/__pycache__'
  --exclude='logs'
  --exclude='dumps'
  --exclude='backups'
  --exclude='db-backups'
  --exclude='*.log'
  --exclude='*.pyc'
  --exclude='*.pyo'
  --exclude='*.egg-info'
  --exclude='*.class'
  --exclude='*.mvn'
  --exclude='**/.git'
  --exclude='**/.idea'
  --exclude='**/.vscode'
  --exclude='**/.DS_Store'
  --exclude='**/tmp'
  --exclude='**/temp'
  --exclude='**/venv'
  --exclude='**/.venv-pptx'
  --exclude='**/.env'
  --exclude='**/env'
  --exclude='**/build/'
  --exclude='**/coverage'
  --exclude='**/tests'
  --exclude='**/out'
  --exclude='**/bin'
  --exclude='**/cache'
  --exclude='**/.pytest_cache'
  --exclude='**/.mypy_cache'
  --exclude='**/.gradle'
  --exclude='**/.classpath'
  --exclude='**/.project'
  --exclude='**/.settings'
  --exclude='**/claude-code'
)

tar -cJvf "$ARCHIVE_NAME" "${EXCLUDES[@]}" .

echo "Created $ARCHIVE_NAME (excluding dependencies and generated files)"
