#!/bin/bash

handle_error() {
    echo "Error: $1"
    exit 1
}

install_app() {
    local app="$1"

    chmod +x "$(pwd)/packages/$app.sh"

    echo "Installing $app..."
    "$(pwd)/packages/$app.sh" > /dev/null 2>&1 || handle_error "Failed to execute $app installation script"
    
    # Display success message
    echo "$app installed successfully"
}

# Function to show the checkbox dialog
show_checkbox_dialog() {
    local options=()
    local app_list=()

    # .sh uzantılı dosyaları app_list'e ekle
    for file in $(pwd)/packages/*.sh; do
        [ -e "$file" ] || continue  # Dosya var mı kontrol et
        filename=$(basename "$file" .sh)
        app_list+=("$filename")
    done

    for app in "${app_list[@]}"; do
        options+=("$app" "" off)
    done

    local result
    result=$(dialog --separate-output --clear --checklist "Select applications to install:" 0 0 0 "${options[@]}" 3>&1 1>&2 2>&3)

    echo "$result"
}

# Main script
echo "System is preparing..."
sudo apt update > /dev/null 2>&1
sudo apt install dialog -y > /dev/null 2>&1

selected_apps=$(show_checkbox_dialog)

# Handle cancel or escape
if [ $? -ne 0 ] || [ -z "$selected_apps" ]; then
    clear
    handle_error "No applications selected or selection canceled."
fi

for app in $selected_apps; do
    install_app "$app" || handle_error "Failed to install $app"
done

echo "All done!"