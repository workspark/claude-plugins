#!/usr/bin/env bash
set -euo pipefail

# Package the workspark Claude plugin, bundling Linux ws binaries.
#
# Usage:
#   ./scripts/package-plugin.sh
#   WS_CLI_DIR=/path/to/ws-v2-cli ./scripts/package-plugin.sh
#
# Output: dist/workspark.plugin

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
WS_CLI_DIR="${WS_CLI_DIR:-${ROOT_DIR}/../humans/systems/workspark/ws-v2-cli}"

cd "${ROOT_DIR}"

VERSION="$(tr -d '[:space:]' < "${WS_CLI_DIR}/VERSION")"
LDFLAGS="-s -w -X github.com/duncanphillips/humans/systems/workspark/ws-cli/cmd.Version=${VERSION}"

echo "Building Linux ws binaries (${VERSION}) from ${WS_CLI_DIR}..."
mkdir -p bin
for arch in arm64 amd64; do
    (cd "${WS_CLI_DIR}" && GOOS=linux GOARCH="${arch}" CGO_ENABLED=0 \
        go build -trimpath -ldflags "${LDFLAGS}" -o "${ROOT_DIR}/bin/ws-linux-${arch}" .)
    echo "  bin/ws-linux-${arch}"
done

echo "Packaging dist/workspark.plugin..."
mkdir -p dist
rm -f /tmp/workspark.plugin dist/workspark.plugin
zip -qr /tmp/workspark.plugin .claude-plugin skills bin README.md -x "*.DS_Store"
cp /tmp/workspark.plugin dist/workspark.plugin

ls -lh dist/workspark.plugin
