#!/bin/bash
# Deploy to AFS from gh-pages branch (built by GitHub Actions)
# Run this from a SNAP machine with AFS access

set -e
AFS_PATH="/afs/cs/group/koyejolab/www"

# Save current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Get latest and switch to gh-pages
git fetch origin
git checkout gh-pages
git pull origin gh-pages

# Copy to AFS
cp -r ./* "$AFS_PATH/"
echo "Deployed to $AFS_PATH"

# Switch back
git checkout "$CURRENT_BRANCH"
