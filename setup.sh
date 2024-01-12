#!/bin/bash

handle_error() {
    echo "Error: $1"
    exit 1
}

display_success() {
    echo "Success: $1"
}

install_app() {
    local app="$1"

    # Print message
    echo "Updating system..."

    # Update and upgrade
    sudo apt update > /dev/null 2>&1 
    sudo apt upgrade -y > /dev/null 2>&1

    # Print message
    echo "Downloading $app Script..."

    # Download script
    wget "https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/$app.sh" -O "./$app.sh" > /dev/null 2>&1 || handle_error "Failed to download $app installation script"
    
    # Make it executable
    chmod +x "./$app.sh"
    
    # Print message
    echo "Installing $app..."

    # Run the script
    "./$app.sh" > /dev/null 2>&1 || handle_error "Failed to execute $app installation script"
    
    # Print message
    echo "Cleaning up..."

    # Clean up
    rm "./$app.sh"

    # Display success message
    display_success "$app installed successfully"
}

# Main script
cd "/home/gokhangunduz/Downloads"
install_app 'vs-code'
install_app 'docker'
install_app 'git'
install_app 'chrome'
echo "All done!"