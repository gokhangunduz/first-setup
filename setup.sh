#!/bin/bash

sudo apt install dialog -y

handle_error() {
    echo "Error: $1"
    exit 1
}

update_and_upgrade() {
    # Print message
    echo "Updating system..."
    sudo apt update > /dev/null 2>&1 
    sudo apt upgrade -y > /dev/null 2>&1
}

install_app() {
    local app="$1"

    # Update and upgrade
    update_and_upgrade || handle_error "Failed to update and upgrade system"

    # Download script
    echo "Downloading $app script..."
    wget "https://raw.githubusercontent.com/gokhangunduz/first-setup/main/installations/$app.sh" -O "./$app.sh" > /dev/null 2>&1 || handle_error "Failed to download $app installation script"
    chmod +x "./$app.sh"

    # Run the script
    echo "Installing $app..."
    "./$app.sh" > /dev/null 2>&1 || handle_error "Failed to execute $app installation script"

    # Clean up
    echo "Cleaning up..."
    rm "./$app.sh"

    # Display success message
    echo "$app installed successfully"
}

# Function to show the checkbox dialog
show_checkbox_dialog() {
    local options=()
    local app_list=("postman" "vs-code" "docker" "git" "chrome" "remmina")

    for app in "${app_list[@]}"; do
        options+=("$app" "" off)
    done

    local result
    result=$(dialog --separate-output --clear --checklist "Select applications to install:" 0 0 0 "${options[@]}" 3>&1 1>&2 2>&3)

    # Handle cancel or escape
    if [ $? -ne 0 ]; then
        handle_error "Selection canceled."
    fi

    echo "$result"
}

# Main script
cd "/home/gokhangunduz/Downloads"

selected_apps=$(show_checkbox_dialog)
if [ -z "$selected_apps" ]; then
    handle_error "No applications selected."
fi

for app in $selected_apps; do
    install_app "$app" || handle_error "Failed to install $app"
done

update_and_upgrade || handle_error "Failed to update and upgrade system"
echo "All done!"
