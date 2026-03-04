#!/bin/bash
# Agent Reach Skill - Standalone Installer
# This script installs agent-reach from the local scripts folder

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "========================================"
echo "  Agent Reach Skill - Installer"
echo "========================================"
echo ""

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_DIR="$SCRIPT_DIR/scripts"

# Check Python
echo -e "${YELLOW}Step 1: Checking Python...${NC}"
if command -v python3 &> /dev/null; then
    PYTHON=python3
elif command -v python &> /dev/null; then
    PYTHON=python
else
    echo -e "${RED}Error: Python is not installed.${NC}"
    echo "Please install Python 3.10+ first."
    exit 1
fi
echo -e "${GREEN}✓ Python found: $($PYTHON --version)${NC}"

# Check pip
echo ""
echo -e "${YELLOW}Step 2: Checking pip...${NC}"
if $PYTHON -m pip --version &> /dev/null; then
    PIP="$PYTHON -m pip"
elif command -v pip3 &> /dev/null; then
    PIP=pip3
elif command -v pip &> /dev/null; then
    PIP=pip
else
    echo -e "${RED}Error: pip is not installed.${NC}"
    echo "Installing pip..."
    $PYTHON -m ensurepip --upgrade || {
        echo -e "${RED}Failed to install pip. Please install it manually.${NC}"
        exit 1
    }
    PIP="$PYTHON -m pip"
fi
echo -e "${GREEN}✓ pip found: $($PIP --version | head -1)${NC}"

# Install from local source
echo ""
echo -e "${YELLOW}Step 3: Installing Agent Reach from local source...${NC}"
cd "$SOURCE_DIR"
$PIP install -e . --quiet || {
    echo -e "${YELLOW}Trying alternative install method...${NC}"
    $PIP install . --quiet
}
echo -e "${GREEN}✓ Agent Reach package installed${NC}"

# Verify installation
echo ""
echo -e "${YELLOW}Step 4: Verifying installation...${NC}"
if command -v agent-reach &> /dev/null; then
    echo -e "${GREEN}✓ agent-reach command is available${NC}"
else
    echo -e "${YELLOW}⚠ agent-reach command not in PATH, trying direct call...${NC}"
    # Add to PATH for current session
    export PATH="$HOME/.local/bin:$PATH"
fi

# Run agent-reach install
echo ""
echo -e "${YELLOW}Step 5: Installing dependencies...${NC}"
agent-reach install --env=auto 2>/dev/null || {
    $PYTHON -m agent_reach.cli install --env=auto
}

# Run doctor
echo ""
echo -e "${YELLOW}Step 6: Running health check...${NC}"
agent-reach doctor 2>/dev/null || {
    $PYTHON -m agent_reach.cli doctor
}

echo ""
echo -e "${GREEN}========================================"
echo "  Installation Complete!"
echo "========================================${NC}"
echo ""
echo "You can now use Agent Reach by asking Claude:"
echo "  - 'Read this webpage: https://...'"
echo "  - 'What's this video about? https://youtube.com/...'"
echo "  - 'Search for Python tutorials'"
echo ""
