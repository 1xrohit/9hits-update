#!/bin/bash

# Define variables
INSTALL_DIR="$HOME"
DOWNLOAD_URL="http://mirror-dl.9hits.com/9hitsv3-linux64.tar.bz2"

# Download 9Hits tarball
wget -O "$INSTALL_DIR/_9hits.tar.bz2" "$DOWNLOAD_URL"

# Extract the downloaded tarball
tar -xjvf "$INSTALL_DIR/_9hits.tar.bz2" -C "$INSTALL_DIR"

# Set permissions
chmod -R 777 "$INSTALL_DIR/9hitsv3-linux64/"
chmod +x "$INSTALL_DIR/9hitsv3-linux64/9hits"
chmod +x "$INSTALL_DIR/9hitsv3-linux64/3rd/9htl"
chmod +x "$INSTALL_DIR/9hitsv3-linux64/browser/9hbrowser"
chmod +x "$INSTALL_DIR/9hitsv3-linux64/9HitsApp"
