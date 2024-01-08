#!/bin/sh

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
ITALIC='\033[3m'
NC='\033[0m' # No Color

# Check if the script is running as root; if not, re-execute it with sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Check if there are any orphaned packages and remove if any.
orphaned_output=$(zypper packages --orphaned)
last_line=$(echo "$orphaned_output" | tail -n 1)

if [ "$last_line" = "No packages found." ]; then
    echo -e "${GREEN}There are no orphaned packages on the system.${NC}"
else
    # Print a red warning before running
    echo -e "${RED}Warning: Inspect the packages before removing for any braking changes.${NC}"
    echo -e "${RED}Sometimes ${ITALIC}zypper${NC} may flag essential packages as orphaned.${NC}"
    echo -e "Update the system before removing anything to prevent such behaviours"
    echo "$orphaned_output" | awk 'NR > 4 && /^\S/ {print $5}' | xargs zypper rm -u
fi

