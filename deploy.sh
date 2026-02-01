#!/bin/bash
# Deploy script for STAIR Lab website
# Usage: bash deploy.sh [--github] [--afs] [--build-only]

set -e

# Configuration
CONDA_ENV="stair"
AFS_PATH="/afs/cs/group/koyejolab/www"
SITE_DIR="_site"
GH_PAGES_BRANCH="gh-pages"
GH_PAGES_URL="https://stair-lab.github.io/stair/"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Parse arguments
BUILD_ONLY=false
DEPLOY_GITHUB=false
DEPLOY_AFS=false

for arg in "$@"; do
    case $arg in
        --build-only)
            BUILD_ONLY=true
            ;;
        --github)
            DEPLOY_GITHUB=true
            ;;
        --afs)
            DEPLOY_AFS=true
            ;;
        --help|-h)
            echo "Usage: bash deploy.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --github       Deploy to GitHub Pages for preview"
            echo "  --afs          Deploy to Stanford AFS (production)"
            echo "  --build-only   Only build the site, don't deploy"
            echo "  --help, -h     Show this help message"
            echo ""
            echo "Examples:"
            echo "  ./deploy.sh --github          # Build and deploy to GitHub Pages"
            echo "  ./deploy.sh --afs             # Build and deploy to AFS"
            echo "  ./deploy.sh --github --afs    # Deploy to both"
            echo "  ./deploy.sh --build-only      # Just build, no deployment"
            exit 0
            ;;
    esac
done

# If no deploy target specified, show help
if [ "$BUILD_ONLY" = false ] && [ "$DEPLOY_GITHUB" = false ] && [ "$DEPLOY_AFS" = false ]; then
    echo "No deployment target specified. Use --github, --afs, or --build-only"
    echo "Run './deploy.sh --help' for usage information."
    exit 1
fi

# Function to print status
print_status() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[X]${NC} $1"
}

print_info() {
    echo -e "${CYAN}[i]${NC} $1"
}

# Change to script directory
cd "$(dirname "$0")"
echo "Working directory: $(pwd)"

# Build the site
echo ""
echo "=== Building Jekyll Site ==="

# Try to find and activate conda
if command -v conda &> /dev/null; then
    print_status "Found conda"
else
    # Try common conda locations
    for conda_path in "$HOME/miniconda3" "$HOME/anaconda3" "/opt/conda" "/lfs/local/0/$USER/miniconda3"; do
        if [ -f "$conda_path/etc/profile.d/conda.sh" ]; then
            source "$conda_path/etc/profile.d/conda.sh"
            print_status "Loaded conda from $conda_path"
            break
        fi
    done
fi

# Activate environment and build
if conda activate "$CONDA_ENV" 2>/dev/null; then
    print_status "Activated conda environment: $CONDA_ENV"

    # Install dependencies if needed
    if ! bundle check &>/dev/null; then
        print_warning "Installing bundle dependencies..."
        bundle install
    fi

    # Build the site
    echo "Building site..."
    bundle exec jekyll build
    print_status "Site built successfully"
else
    # Fallback: try using direct path to bundle
    RUBY_PATH="/lfs/local/0/$USER/miniconda3/envs/$CONDA_ENV/bin"
    if [ -x "$RUBY_PATH/bundle" ]; then
        print_warning "Using direct path to Ruby: $RUBY_PATH"
        export PATH="$RUBY_PATH:$PATH"

        if ! bundle check &>/dev/null; then
            bundle install
        fi

        bundle exec jekyll build
        print_status "Site built successfully"
    else
        print_error "Could not activate conda environment or find Ruby"
        print_error "Try running: conda env create -f environment.yaml"
        exit 1
    fi
fi

# Check if _site exists
if [ ! -d "$SITE_DIR" ]; then
    print_error "Site directory '$SITE_DIR' not found."
    exit 1
fi

# Deploy to GitHub Pages
if [ "$DEPLOY_GITHUB" = true ]; then
    echo ""
    echo "=== Deploying to GitHub Pages ==="

    # Save current branch
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    print_info "Current branch: $CURRENT_BRANCH"

    # Create a temporary directory for gh-pages
    TEMP_DIR=$(mktemp -d)
    print_info "Using temp directory: $TEMP_DIR"

    # Copy _site contents to temp
    cp -r "$SITE_DIR"/* "$TEMP_DIR/"

    # Add .nojekyll to prevent GitHub from processing with Jekyll
    touch "$TEMP_DIR/.nojekyll"

    # Check if gh-pages branch exists
    if git show-ref --verify --quiet refs/heads/$GH_PAGES_BRANCH; then
        print_info "Switching to existing $GH_PAGES_BRANCH branch"
        git checkout $GH_PAGES_BRANCH
    else
        print_info "Creating new $GH_PAGES_BRANCH branch"
        git checkout --orphan $GH_PAGES_BRANCH
        git rm -rf . 2>/dev/null || true
    fi

    # Clean current directory (except .git)
    find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +

    # Copy from temp
    cp -r "$TEMP_DIR"/* .
    cp "$TEMP_DIR/.nojekyll" .

    # Commit and push
    git add -A
    git commit -m "Deploy to GitHub Pages: $(date '+%Y-%m-%d %H:%M:%S')" || print_warning "No changes to commit"
    git push origin $GH_PAGES_BRANCH --force

    print_status "Pushed to $GH_PAGES_BRANCH branch"

    # Switch back to original branch
    git checkout "$CURRENT_BRANCH"
    print_status "Switched back to $CURRENT_BRANCH"

    # Cleanup
    rm -rf "$TEMP_DIR"

    echo ""
    print_status "GitHub Pages deployment complete!"
    print_info "Preview URL: $GH_PAGES_URL"
    print_info "Note: Enable GitHub Pages in repo settings if not already done"
    print_info "      Settings > Pages > Source: Deploy from branch '$GH_PAGES_BRANCH'"
fi

# Deploy to AFS
if [ "$DEPLOY_AFS" = true ]; then
    echo ""
    echo "=== Deploying to AFS ==="

    # Check if AFS path exists
    if [ ! -d "$AFS_PATH" ]; then
        print_error "AFS path not found: $AFS_PATH"
        print_error "Make sure you're on a machine with AFS access (e.g., SNAP)"
        exit 1
    fi

    # Check for AFS token
    if ! tokens 2>/dev/null | grep -q "afs@"; then
        print_warning "No AFS token found. You may need to run: kinit && aklog"
    fi

    # Copy files
    echo "Copying files to $AFS_PATH..."
    cp -r "$SITE_DIR"/* "$AFS_PATH/"
    print_status "Deployed to $AFS_PATH"
fi

echo ""
echo "=== Done ==="
if [ "$BUILD_ONLY" = true ]; then
    print_status "Site built in $SITE_DIR/"
fi
if [ "$DEPLOY_GITHUB" = true ]; then
    print_status "Preview: $GH_PAGES_URL"
fi
if [ "$DEPLOY_AFS" = true ]; then
    print_status "Production: https://stair.cs.stanford.edu/"
fi
