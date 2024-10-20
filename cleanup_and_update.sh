#!/bin/bash

# Cleanup system cache and temporary files
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

# Optimizing storage and verifying disk
echo "Optimizing and verifying disk..."
sudo diskutil verifyVolume /
sudo diskutil repairVolume /

# Update macOS software
echo "Updating macOS and system software..."
sudo softwareupdate -i -a

# Automatically update apps from App Store
echo "Updating App Store applications..."
mas upgrade

# Enable App Store automatic updates
echo "Ensuring App Store apps will auto-update in the future..."
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool TRUE

# Update Homebrew and its packages
echo "Updating Homebrew..."
brew update
brew upgrade
brew cleanup -s

# Update pip and its packages
echo "Updating pip and its packages..."
pip3 install --upgrade pip
pip3 list --outdated | grep -v '^\-e' | cut -d ' ' -f1 | xargs -n1 pip3 install -U

# Uninstall old Python versions
echo "Uninstalling old Python versions..."
brew cleanup python

# Update npm global packages (Node.js)
echo "Updating global npm packages..."
npm install -g npm
npm update -g

# Update Rust packages
echo "Updating Rust and Cargo packages..."
rustup update
cargo install-update -a

# Repair disk permissions (for older macOS versions)
echo "Repairing disk permissions..."
diskutil repairPermissions /

# Check disk health
echo "Checking disk health..."
diskutil verifyDisk /

# Run a virus scan (optional, requires third-party software or macOS XProtect)
echo "Running a virus scan..."
# Uncomment the following line if you have a third-party virus scanner installed (replace 'your-virus-scanner' with the actual command):
# your-virus-scanner scan --all

# Check for any pending macOS updates again and restart if needed
echo "Checking for any macOS updates and restarting if necessary..."
sudo softwareupdate --install --all --restart

echo "System cleanup, update, and optimization process completed!"

