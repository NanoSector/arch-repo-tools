#!/bin/bash

REPO_PKG_DIR="/srv/http/repo"
REPO_DB_FILE="/srv/http/repo/nanosector.db.tar.gz"
REPO_NAME="nanosector"

TOUPDATE=$(aurcheck -q -d $REPO_NAME)

if [ -z $TOUPDATE ]; then
    echo "No packages to update. Exiting."
    exit
fi

echo "Packages to update:"
echo "$TOUPDATE"
echo "Calling pacaur..."

PKGDEST=$REPO_PKG_DIR pacaur -m $TOUPDATE

if [ $? -ne 0 ]; then
    echo "Pacaur returned a non-zero exit code. Will not import packages. Exiting."
    exit
fi

echo "Generating new repository database..."
repo-add -R -n -q $REPO_DB_FILE $REPO_PKG_DIR/*.pkg.tar.xz
echo "All done!"
