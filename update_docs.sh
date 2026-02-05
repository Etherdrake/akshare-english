#!/bin/bash
# AKShare English Documentation - Autonomous Update Script
# Run via OpenClaw cronjob

set -e

REPO_DIR="$HOME/clawd/akshare-english"
DEPLOY_KEY="$HOME/.ssh/akshare_english_deploy"
GIT_REPO="git@github.com:Etherdrake/akshare-english.git"

echo "=== AKShare English Docs Update ==="
echo "Date: $(date)"
echo ""

# Check if deploy key exists
if [ ! -f "$DEPLOY_KEY" ]; then
    echo "ERROR: Deploy key not found at $DEPLOY_KEY"
    exit 1
fi

# Set SSH to use deploy key
export GIT_SSH_COMMAND="ssh -i $DEPLOY_KEY -o IdentitiesOnly=yes"

# Navigate to repository
cd "$REPO_DIR"

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Uncommitted changes found:"
    git status --short
    echo ""
    echo "Committing changes..."
    git add -A
    git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M')"
else
    echo "No uncommitted changes."
fi

# Check for upstream changes
echo "Checking for upstream updates..."
git fetch origin

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Upstream changes found. Pulling..."
    git pull origin main --rebase
else
    echo "Repository is up to date."
fi

# Deploy to GitHub Pages
echo ""
echo "Deploying to GitHub Pages..."
pip install -q mkdocs mkdocs-material
mkdocs gh-deploy --force --site-dir site 2>/dev/null || echo "Deploy completed (or no changes)"

echo ""
echo "=== Update Complete ==="
