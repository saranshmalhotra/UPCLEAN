Here's a detailed and professional `README.md` for your `UPCLEAN` project. This `README` will help users understand what the script does, how to install and use it, and provide details on the functionality it offers. I've also included a section for future development and contributions.

---

# UPCLEAN

**UPCLEAN** is a macOS system cleanup and performance optimization script. It automates the process of cleaning caches, freeing up memory, updating system software, and keeping installed applications up-to-date via Homebrew, pip, npm, and more. This script is designed to ensure your macOS environment runs smoothly with minimal manual intervention.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Features

- **System Cleanup**: Cleans up macOS system cache, temporary files, and browser caches.
- **Memory Optimization**: Frees inactive memory to improve performance.
- **macOS Updates**: Automatically updates macOS and any available system software.
- **App Store Updates**: Updates applications installed from the App Store.
- **Homebrew Updates**: Updates Homebrew itself and all installed formulae.
- **Python Package Updates**: Automatically updates pip and installed Python packages.
- **Node.js Package Updates**: Updates globally installed npm packages.
- **Rust Updates**: Updates Rust and Cargo packages.
- **Disk Health Check**: Verifies and repairs the macOS disk.
- **DNS Cache Clearing**: Flushes DNS cache for improved network performance.
- **Automatic App Store App Updates**: Ensures automatic updates for App Store apps in the future.
  
## Requirements

To use UPCLEAN, you’ll need the following installed on your system:

- macOS (preferably latest version)
- Homebrew (https://brew.sh)
- Python and pip (`brew install python`)
- Node.js and npm (`brew install node`)
- Rust and Cargo (`brew install rustup-init && rustup-init`)

Additionally, to update App Store apps, you'll need the `mas` command-line tool:

```bash
brew install mas
```

## Installation

1. **Clone the Repository**: Clone this repository to your local machine:

   ```bash
   git clone https://github.com/saranshmalhotra/UPCLEAN.git
   cd UPCLEAN
   ```

2. **Make the Script Executable**:

   Run the following command to make the script executable:

   ```bash
   chmod +x cleanup_and_update.sh
   ```

3. **(Optional) Move the Script to `/usr/local/bin` for Global Access**:

   You can move the script to `/usr/local/bin` to access it from anywhere on your system:

   ```bash
   sudo mv cleanup_and_update.sh /usr/local/bin/upclean
   ```

   Now you can run the command using `upclean` from any terminal session.

## Usage

To use the UPCLEAN script, simply run the following command in your terminal:

```bash
upclean
```

This will execute the script and automatically handle the following tasks:

1. Clean system and browser caches.
2. Free up inactive memory.
3. Check for and install macOS updates.
4. Update App Store applications.
5. Update Homebrew and all installed formulae.
6. Update Python packages (via pip).
7. Update globally installed npm packages.
8. Update Rust and Cargo packages.
9. Check and repair the disk (if necessary).
10. Flush DNS cache.
11. Enable automatic updates for App Store apps.

You will be prompted for your administrator password during the process as some operations (e.g., system updates and disk repairs) require elevated privileges.

### Example

```bash
$ upclean
Cleaning system cache and temporary files...
Freeing up RAM and inactive memory...
Clearing DNS cache...
Updating macOS and system software...
Updating App Store applications...
Updating Homebrew...
Updating pip and its packages...
Updating global npm packages...
Updating Rust and Cargo packages...
Verifying and repairing disk...
Process completed!
```

## How It Works

The UPCLEAN script automates common system maintenance tasks by using native macOS commands and third-party tools like Homebrew, pip, npm, and Rust. Here’s a breakdown of the core functionalities:

1. **System Cleanup**: Deletes unnecessary cache files from `/Library/Caches`, `/System/Library/Caches`, `/private/tmp`, and `/private/var` directories.
2. **Memory Optimization**: Uses the `purge` command to free up inactive memory.
3. **macOS and App Store Updates**: Utilizes `softwareupdate` and `mas` commands to update macOS and App Store apps.
4. **Homebrew, pip, npm, and Rust Updates**: Executes `brew update`, `pip install --upgrade`, and similar commands to keep these tools and packages up to date.
5. **Disk Health and DNS Flush**: Runs `diskutil verifyVolume` and `repairVolume` to check and repair disks, and `dscacheutil -flushcache` to flush DNS cache.

## Troubleshooting

If you encounter any issues while running the script, check the following:

- **Permission Issues**: Make sure you run the script with `sudo` if required, as certain commands need elevated privileges.
- **Homebrew Not Installed**: Install Homebrew if it’s not available by visiting https://brew.sh.
- **Pip, npm, or Rust Issues**: Ensure these package managers are properly installed and configured.

To debug specific parts of the script, you can modify it and add `echo` commands or `set -x` to trace the commands being executed.

## Contributing

Contributions are welcome! If you have ideas for improving UPCLEAN or fixing bugs, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes (`git push origin feature/your-feature-name`).
5. Submit a Pull Request.

### Future Improvements

- Add more OS-level optimizations.
- Support for custom user configuration (e.g., specify what packages or caches to clean).
- Add Windows and Linux support.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

