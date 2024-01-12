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
    echo "Installing Docker..."
    # Add Docker installation commands here
    # Example: sudo apt-get install docker-ce -y
}

# Function to install Git
install_git() {
    echo "Installing Git..."
    # Add Git installation commands here
    # Example: sudo apt-get install git -y
}

# Function to install Chrome
install_chrome() {
    echo "Installing Chrome..."
    # Add Chrome installation commands here
    # Example: wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
}

# Function to install VS Code
install_vscode() {
    echo "Installing VS Code..."
    
    # Download vs-code.sh script
    wget 'https://github.com/gokhangunduz/first-setup/installations/vs-code.sh' -O /tmp/vs-code.sh || handle_error "Failed to download VS Code installation script"
    
    # Make it executable
    chmod +x ./vs-code.sh
    
    # Run the script
    ./vs-code.sh || handle_error "Failed to execute VS Code installation script"
    
    # Clean up
    rm ./vs-code.sh
}

# ...

# Main script
cd /Downloads

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

# Install VS Code
install_vscode || handle_error "Failed to install VS Code"
display_success "VS Code installed successfully"
