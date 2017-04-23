#!/bin/bash

REPO_PKG_DIR="/srv/http/repo"
REPO_DB_FILE="/srv/http/repo/nanosector.db.tar.gz"
REPO_NAME="nanosector"

echo "Generating new repository database..."
repo-add $REPO_DB_FILE $REPO_PKG_DIR/*.pkg.tar.xz -R -n -q
echo "All done!"
