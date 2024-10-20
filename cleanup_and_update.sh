#!/bin/bash

# Function to clean up system caches, temporary files, and browser caches
cleanup() {
    echo "Cleaning system cache and temporary files..."
    sudo rm -rf /Library/Caches/*
    sudo rm -rf ~/Library/Caches/*
    sudo rm -rf /System/Library/Caches/*
    sudo rm -rf /private/var/tmp/*
    sudo rm -rf /private/var/folders/*
    sudo rm -rf /private/tmp/*

    # Free up inactive memory (for performance boost)
    echo "Freeing up RAM and inactive memory..."
    sudo purge

    # Clear DNS cache
    echo "Clearing DNS cache..."
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder

    # Clear browser caches (optional)
    echo "Clearing browser caches..."
    rm -rf ~/Library/Caches/com.apple.Safari
    rm -rf ~/Library/Caches/Google/Chrome
}

# Function to upgrade system, App Store apps, and installed packages
upgrade() {
    echo "Updating macOS and system software..."
    sudo softwareupdate -i -a

    echo "Updating App Store applications..."
    mas upgrade

    echo "Updating Homebrew and its packages..."
    brew update
    brew upgrade
    brew cleanup -s

    echo "Updating pip and its packages..."
    pip3 install --upgrade pip
    pip3 list --outdated | grep -v '^\-e' | cut -d ' ' -f1 | xargs -n1 pip3 install -U

    echo "Updating global npm packages..."
    npm install -g npm
    npm update -g

    echo "Updating Rust and Cargo packages..."
    rustup update
    cargo install-update -a
}

# Function to repair disk and verify health
disk_check() {
    echo "Optimizing and verifying disk..."
    sudo diskutil verifyVolume /
    sudo diskutil repairVolume /
}

# Main logic to handle user input using getopts
while getopts ":cu" opt; do
    case $opt in
        c)
            echo "Starting cleanup process..."
            cleanup
            ;;
        u)
            echo "Starting cleanup and upgrade process..."
            cleanup
            upgrade
            disk_check
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 [-c] [-u]"
            exit 1
            ;;
    esac
done

# If no options are provided
if [ $OPTIND -eq 1 ]; then
    echo "No options were passed. Please use one of the following:"
    echo "  -c   Clean up system caches and temporary files"
    echo "  -u   Clean up and upgrade the system, apps, and packages"
    exit 1
fi

