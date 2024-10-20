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


---

## Usage

The `UPCLEAN` script offers two main options for performing system maintenance tasks: one for cleaning up the system and another for cleaning up and upgrading both the system and installed applications.

### 1. **Cleanup Only (`-c` Option)**

To **only clean up** system caches, free up memory, and clear DNS and browser caches, you can use the `-c` option. This will not perform any software upgrades.

#### Example Command:

```bash
upclean -c
```

#### Actions Performed:
- Cleans system caches from `/Library/Caches`, `/System/Library/Caches`, `/private/tmp`, and `/private/var`.
- Clears browser caches for Safari and Chrome.
- Frees inactive memory using the `purge` command.
- Clears the DNS cache.

This option is ideal when you just want to free up space and improve system performance without upgrading software.

### 2. **Cleanup and Upgrade (`-u` Option)**

To **clean up the system** and also **upgrade** macOS, App Store applications, Homebrew, Python packages, npm packages, and Rust packages, use the `-u` option.

#### Example Command:

```bash
upclean -u
```

#### Actions Performed:
1. **Cleanup**:
   - Cleans system caches.
   - Frees inactive memory.
   - Clears DNS and browser caches.

2. **Upgrade**:
   - **macOS System Updates**: Runs `softwareupdate` to install any available macOS updates.
   - **App Store Updates**: Uses `mas` to update applications installed via the Mac App Store.
   - **Homebrew Updates**: Updates Homebrew itself and all installed formulae, then cleans up outdated packages.
   - **Python Packages**: Upgrades `pip` and updates all Python packages installed via `pip`.
   - **Node.js Packages**: Updates globally installed npm packages.
   - **Rust Packages**: Updates Rust and all installed Cargo packages.

3. **Disk Check and Repair**:
   - Verifies and repairs disk health using `diskutil`.

This option is useful when you want to perform full system maintenance, including software updates and disk checks.

### 3. **Help and Invalid Options**

If you use an invalid option or no options at all, the script will display a usage message with valid options:

#### Example Command:

```bash
upclean -x
```

#### Output:

```bash
Invalid option: -x
Usage: ./upclean [-c] [-u]
```

If you run the script without any options, it will also prompt you to choose one of the available options.

---

### Example Usage Scenarios

1. **Quick Cleanup**:
   - You want to quickly clean your system without upgrading software:
     ```bash
     upclean -c
     ```

2. **Full Cleanup and Upgrade**:
   - You want to clean the system and upgrade macOS, apps, and packages in one go:
     ```bash
     upclean -u
     ```

---

### Summary of Options:

- `-c`: Cleanup only (system caches, memory, DNS, browser caches).
- `-u`: Cleanup and upgrade (includes software updates and disk checks).

### Requirements

To use this script, you will need the following tools installed on your macOS system:

- **Homebrew**: For managing system packages (https://brew.sh).
- **pip**: To manage Python packages (`brew install python`).
- **npm**: To manage Node.js packages (`brew install node`).
- **Rust**: To update Rust and Cargo packages (`brew install rustup-init`).
- **mas**: To manage App Store app updates (`brew install mas`).
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

