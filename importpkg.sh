#!/bin/bash

REPO_PKG_DIR="/srv/http/repo"
REPO_DB_FILE="/srv/http/repo/nanosector.db.tar.gz"
REPO_NAME="nanosector"

TO_IMPORT=$*

if [ -z $TO_IMPORT ]; then
    echo "No packages specified. Exiting."
    exit
fi

echo "Packages to import:"
echo "$TO_IMPORT"
echo "Calling pacaur..."

PKGDEST=$REPO_PKG_DIR pacaur -m $TO_IMPORT --noconfirm

if [ $? -ne 0 ]; then
    echo "Pacaur returned a non-zero exit code. Will not import packages. Exiting."
    exit
fi

echo "Generating new repository database..."
repo-add $REPO_DB_FILE $REPO_PKG_DIR/*.pkg.tar.xz -R -n -q
echo "All done!"
