#!/bin/bash

# Function to install necessary libraries
install_libraries() {
    echo "Installing necessary libraries..."
    apt-get update
    apt-get install -y unzip acl cron xvfb bzip2 libcanberra-gtk-module libxss1 htop sed tar libxtst6 libnss3 wget psmisc bc libgtk-3-0 libgbm-dev libatspi2.0-0 libatomic1
    echo "Libraries installed successfully."
}

# Function to install 9Hits app
install_9hits_app() {
    echo "Installing 9Hits app..."

    # Define the URL of the file to download
#local file_url="http://mirror-dl.9hits.com/3.0.4/9hitsv3-linux64.tar.bz2"
    local file_url="https://github.com/ROHIT0X1/9hits-update/releases/download/v2.0/9hitsv3-linux64.tar.gz"

    # Define the installation directory
    local INSTALL_DIR="$HOME/9hits_installation"

    # Create installation directory if it doesn't exist
    mkdir -p "$INSTALL_DIR"

    # Download the file using wget
    wget "$file_url" -P "$INSTALL_DIR"

    # Check if wget command was successful
    if [ $? -eq 0 ]; then
        echo "File downloaded successfully."

        # Extract the downloaded file to the installation directory
        tar -xzvf "$INSTALL_DIR/9hitsv3-linux64.tar.bz2" -C "$INSTALL_DIR"
         #tar -xjvf "$INSTALL_DIR/9hitsv3-linux64.tar.bz2" -C "$INSTALL_DIR"

        # Check if extraction was successful
        if [ $? -eq 0 ]; then
            echo "File extracted successfully to $INSTALL_DIR."

            # Set permissions
            chmod -R 777 "$INSTALL_DIR/9hitsv3-linux64/"
            chmod +x "$INSTALL_DIR/9hitsv3-linux64/9hits"
            chmod +x "$INSTALL_DIR/9hitsv3-linux64/3rd/9htl"
            chmod +x "$INSTALL_DIR/9hitsv3-linux64/browser/9hbrowser"
            chmod +x "$INSTALL_DIR/9hitsv3-linux64/9HitsApp"

            echo "Permissions set successfully."

            # Execute 9hits
            echo "Executing 9hits..."
            cd "$INSTALL_DIR/9hitsv3-linux64/"
            ./9hits
            cd -
            echo "9hits executed."

        else
            echo "Error: Failed to extract the file."
        fi

    else
        echo "Error: Failed to download the file."
    fi
}

# Call the function to install necessary libraries
install_libraries

# Call the function to install 9Hits app
install_9hits_app
