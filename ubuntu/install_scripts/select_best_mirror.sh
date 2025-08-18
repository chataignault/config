#!/bin/bash

# https://askubuntu.com/questions/913180/what-are-mirrors
# https://linuxconfig.org/how-to-select-the-fastest-apt-mirror-on-ubuntu-linux

# select best mirror with netselect

if ! command -v netselect &> /dev/null; then
	echo "Install netselect package..."
	wget http://ftp.us.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-29_amd64.deb
	sudo dpkg -i netselect_0.3.ds1-29_amd64.deb
	rm netselect_0.3.ds1-29_amd64.deb
fi

# get the best mirror
BEST_MIRROR=$(sudo netselect -s 20 -t 40 $(wget -qO - mirrors.ubuntu.com/mirrors.txt) \
	| head -n 1 | awk '{print $2}')

if [ -z "$BEST_MIRROR" ]; then
    echo "Failed to select best mirror"
    exit 1
fi

echo "Selected best mirror: $BEST_MIRROR"

# Ask for user confirmation
echo "Do you want to update /etc/apt/sources.list.d/ubuntu.sources with this mirror? (y/N)"
read -r response
case "$response" in
    [yY][eE][sS]|[yY])
        echo "Proceeding with mirror update..."
        ;;
    *)
        echo "Mirror update cancelled"
        exit 0
        ;;
esac

# Backup current ubuntu.sources
sudo cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.backup

# Update the main repository URI (not security)
sudo sed -i "/^Types: deb$/,/^$/{ /^URIs:/ { /security\.ubuntu\.com/! s|^URIs:.*|URIs: $BEST_MIRROR|; } }" /etc/apt/sources.list.d/ubuntu.sources

echo "Updated /etc/apt/sources.list.d/ubuntu.sources with best mirror: $BEST_MIRROR"
echo "Running apt update..."
sudo apt update

