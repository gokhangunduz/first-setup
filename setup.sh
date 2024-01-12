#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Function to display success message
display_success() {
    echo "Success: $1"
}

# Function to install Docker
install_docker() {
  # Download script
    wget 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/docker.sh' -O ./docker.sh > /dev/null 2>&1 || handle_error "Failed to download VS Code installation script"
    
    # Make it executable
    chmod +x ./docker.sh
    
    # Print message
    echo "Installing Dockers..."

    # Run the script
    ./docker.sh > /dev/null 2>&1 || handle_error "Failed to execute VS Code installation script"
    
    # Clean up
    rm ./docker.sh
}

# Function to install Git
install_git() {
  # Download script
    wget 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/git.sh' -O ./git.sh > /dev/null 2>&1 || handle_error "Failed to download VS Code installation script"
    
    # Make it executable
    chmod +x ./git.sh
    
    # Print message
    echo "Installing Git..."

    # Run the script
    ./git.sh > /dev/null 2>&1 || handle_error "Failed to execute VS Code installation script"
    
    # Clean up
    rm ./git.sh
}

# Function to install Chrome
install_chrome() {
  # Download script
    wget 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/chrome.sh' -O ./chrome.sh > /dev/null 2>&1 || handle_error "Failed to download VS Code installation script"
    
    # Make it executable
    chmod +x ./chrome.sh
    
    # Print message
    echo "Installing Google Chrome..."

    # Run the script
    ./chrome.sh > /dev/null 2>&1 || handle_error "Failed to execute VS Code installation script"
    
    # Clean up
    rm ./chrome.sh
}

# Function to install VS Code
install_vscode() {
    # Download script
    wget 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/vs-code.sh' -O ./vs-code.sh > /dev/null 2>&1 || handle_error "Failed to download VS Code installation script"
    
    # Make it executable
    chmod +x ./vs-code.sh
    
    # Print message
    echo "Installing VS Code..."

    # Run the script
    ./vs-code.sh > /dev/null 2>&1 || handle_error "Failed to execute VS Code installation script"
    
    # Clean up
    rm ./vs-code.sh
}

# ...

# Main script
cd /home/gokhangunduz/Downloads


# Install VS Code
install_vscode || handle_error "Failed to install VS Code"
display_success "VS Code installed successfully"

# Install Docker
install_docker || handle_error "Failed to install Docker"
display_success "Docker installed successfully"

# Install Git
install_git || handle_error "Failed to install Git"
display_success "Git installed successfully"

# Install Chrome
install_chrome || handle_error "Failed to install Chrome"
display_success "Chrome installed successfully"
