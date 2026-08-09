#!/bin/bash
# AKShare English Documentation Sync Script
# Syncs documentation from upstream Chinese AKShare repo and rebuilds English docs

set -e

REPO_DIR="$HOME/clawd/akshare-english"
cd "$REPO_DIR"

# Configure SSH for GitHub
export GIT_SSH_COMMAND="ssh -i ~/.ssh/akshare_english_deploy -o IdentitiesOnly=yes"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

log_info "Starting AKShare documentation sync..."

# Step 1: Fetch upstream changes
log_info "Fetching upstream changes..."
git fetch upstream --tags --quiet

# Get current upstream version
UPSTREAM_VERSION=$(git describe --tags upstream/main 2>/dev/null || echo "unknown")
log_info "Upstream version: $UPSTREAM_VERSION"

# Step 2: Check what docs changed since last sync
log_info "Checking for documentation changes..."
UPDATED_DOCS=$(git diff --name-only HEAD upstream/main -- '*.md' '*.rst' 'docs/**' 2>/dev/null | grep -E '\.(md|rst)$' || true)

if [ -z "$UPDATED_DOCS" ]; then
    log_info "No documentation changes detected in upstream."
    log_info "Sync complete - nothing to do."
    exit 0
fi

DOC_COUNT=$(echo "$UPDATED_DOCS" | wc -l)
log_info "Found $DOC_COUNT changed documentation files:"
echo "$UPDATED_DOCS" | head -20

# Step 3: Copy updated docs from upstream akshare repo
log_info "Copying updated documentation..."
AKSHARE_UPSTREAM="$REPO_DIR/akshare"

# Sync key documentation files
SYNC_FILES=(
    "docs/changelog.md"
    "docs/installation.md"
    "docs/tutorial.md"
    "docs/introduction.md"
)

for file in "${SYNC_FILES[@]}"; do
    if [ -f "$AKSHARE_UPSTREAM/$file" ]; then
        cp "$AKSHARE_UPSTREAM/$file" "$REPO_DIR/$file"
        log_info "  Updated: $file"
    fi
done

# Step 4: Check for new API documentation
NEW_API_DOCS=$(git diff --name-only HEAD upstream/main -- 'docs/api/**' 'docs/tool/**' 2>/dev/null | grep -E '\.md$' || true)
if [ -n "$NEW_API_DOCS" ]; then
    log_info "New API docs detected:"
    echo "$NEW_API_DOCS"
fi

# Step 5: Stage changes
log_info "Staging changes..."
git add -A

# Check if there are actual changes to commit
if git diff --cached --quiet; then
    log_info "No changes to commit after copy."
    exit 0
fi

# Step 6: Commit changes
COMMIT_MSG="Auto-sync: $(date '+%Y-%m-%d %H:%M') - Updated documentation"
log_info "Committing with: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Step 7: Pull with rebase
log_info "Pulling from origin with rebase..."
git pull origin main --rebase --quiet || log_warn "Pull failed, continuing anyway..."

# Step 8: Build and deploy docs
log_info "Building documentation..."
pip install -q mkdocs mkdocs-material

# Deploy to GitHub Pages
log_info "Deploying to GitHub Pages..."
mkdocs gh-deploy --force --quiet 2>&1 | tail -5

# Step 9: Push to origin
log_info "Pushing to origin..."
git push origin main --quiet

log_info "Sync completed successfully!"
echo ""
echo "Summary:"
echo "  - Files updated: $DOC_COUNT"
echo "  - Upstream version: $UPSTREAM_VERSION"
echo "  - Deployed to GitHub Pages"
