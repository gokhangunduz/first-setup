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

# Function to install a program
install_program() {
    local script_url="$1"
    local program_name="$2"

    # Download script
    wget "$script_url" -O "./$program_name.sh" > /dev/null 2>&1 || handle_error "Failed to download $program_name installation script"
    
    # Make it executable
    chmod +x "./$program_name.sh"
    
    # Print message
    echo "Installing $program_name..."

    # Run the script
    "./$program_name.sh" > /dev/null 2>&1 || handle_error "Failed to execute $program_name installation script"
    
    # Clean up
    rm "./$program_name.sh"

    # Display success message
    display_success "$program_name installed successfully"
}

# Main script
cd "$HOME/Downloads"

sudo apt update
sudo apt upgrade -y

# Install VS Code
install_program 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/vs-code.sh' 'VS Code'

# Install Docker
install_program 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/docker.sh' 'Docker'

# Install Git
install_program 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/git.sh' 'Git'

# Install Chrome
install_program 'https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/chrome.sh' 'Google Chrome'
