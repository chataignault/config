#!/bin/bash
# Script to safely replace existing swap file with a larger 8GB swap file
# https://askubuntu.com/questions/178712/how-to-increase-swap-space

set -e  # Exit on any error

NEW_SWAP_FILE="/swapfile.img"
NEW_SWAP_SIZE="15G"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root" >&2
   exit 1
fi

echo "=== Current swap status ==="
cat /proc/swaps

# Check available disk space
AVAILABLE_SPACE=$(df / | awk 'NR==2 {print $4}')
REQUIRED_SPACE=$((8 * 1024 * 1024))  # 8GB in KB

if [[ $AVAILABLE_SPACE -lt $REQUIRED_SPACE ]]; then
    echo "Error: Insufficient disk space. Need 8GB, have $(($AVAILABLE_SPACE / 1024 / 1024))GB available" >&2
    exit 1
fi

# Get current swap files from /proc/swaps (excluding header)
CURRENT_SWAPS=$(awk 'NR>1 && $1 ~ /^\/.*\.img$/ {print $1}' /proc/swaps)

# Disable existing swap files
if [[ -n "$CURRENT_SWAPS" ]]; then
    echo "=== Disabling existing swap files ==="
    for swap_file in $CURRENT_SWAPS; do
        echo "Disabling $swap_file"
        swapoff "$swap_file" || echo "Warning: Failed to disable $swap_file"
        
        # Remove from fstab
        if grep -q "$swap_file" /etc/fstab; then
            echo "Removing $swap_file from /etc/fstab"
            sed -i "\|$swap_file|d" /etc/fstab
        fi
        
        # Remove old swap file
        if [[ -f "$swap_file" ]]; then
            echo "Removing old swap file $swap_file"
            rm -f "$swap_file"
        fi
    done
fi

# Check if new swap file already exists
if [[ -f "$NEW_SWAP_FILE" ]]; then
    echo "Warning: $NEW_SWAP_FILE already exists, removing it"
    rm -f "$NEW_SWAP_FILE"
fi

echo "=== Creating new $NEW_SWAP_SIZE swap file ==="
# Create new swap file
fallocate -l "$NEW_SWAP_SIZE" "$NEW_SWAP_FILE" || {
    echo "fallocate failed, using dd instead"
    dd if=/dev/zero of="$NEW_SWAP_FILE" bs=1M count=8192 status=progress
}

# Set proper permissions
chmod 600 "$NEW_SWAP_FILE"

# Format as swap
echo "Formatting $NEW_SWAP_FILE as swap"
mkswap "$NEW_SWAP_FILE"

# Add to fstab if not already present
if ! grep -q "$NEW_SWAP_FILE" /etc/fstab; then
    echo "Adding $NEW_SWAP_FILE to /etc/fstab"
    echo "$NEW_SWAP_FILE none swap sw 0 0" >> /etc/fstab
fi

# Activate new swap
echo "Activating new swap file"
swapon "$NEW_SWAP_FILE"

echo "=== Updated swap status ==="
cat /proc/swaps

echo "=== Success! Swap file replacement completed ==="

