![setup.sh](/docs/images/app.png "setup.sh")

# First Setup Toolkit

A Bash script collection that sets up a developer environment with a single command. You choose which applications to install.

---

## Supported Operating Systems

| Distribution | Support | Notes |
|--------------|---------|-------|
| **Ubuntu 22.04 LTS** | Full | Primary target |
| **Ubuntu 24.04 LTS** | Full | Primary target |
| **Linux Mint 21 / 22** | Mostly | `settings.sh` won't find Yaru theme; GNOME edition recommended |
| **Pop!_OS 22.04 / 24.04** | Mostly | GNOME-based; Yaru theme unavailable, other steps work |
| **Debian 12 (Bookworm)** | Partial | `snap` not installed by default; Docker repo is Ubuntu-specific |
| Fedora / Arch / openSUSE | Not supported | `apt` is not available |
| Elementary OS | Not supported | Uses Pantheon desktop, not GNOME |

> `settings.sh` works fully only on systems with GNOME and the `dash-to-dock` extension active.

---

## Available Packages

| Package | Method |
|---------|--------|
| Google Chrome | `.deb` (Google CDN) |
| Docker + Compose v2 | Official Docker repository |
| Git | `apt` |
| Node.js (LTS) | `nvm` |
| VS Code | `.deb` (Microsoft CDN) |
| Postman | `snap` |
| Remmina | `snap` |
| zsh + oh-my-zsh | `apt` + installer script |

---

## Usage

### 1. Clone the repository

```bash
git clone https://github.com/gokhangunduz/first-setup
cd first-setup
chmod +x ./setup.sh
```

### 2. (Optional) Customize configuration

Edit `config.sh`:

```bash
GIT_USER_NAME="your-name"
GIT_USER_EMAIL="you@mail.com"
```

Or pass as environment variables at runtime:

```bash
GIT_USER_NAME="your-name" GIT_USER_EMAIL="you@mail.com" ./setup.sh
```

### 3. Run the setup

```bash
./setup.sh
```

A package list appears in the terminal. Enter the numbers of the packages you want to install separated by spaces, or type `all`:

```
Available packages:
-------------------
  [1] chrome
  [2] docker
  [3] git
  ...

Enter numbers separated by spaces (e.g. 1 3 4) or "all":
>
```

When the installation is complete, you can review the log:

```bash
cat /tmp/first-setup.log
```

### Dry-run mode

Preview what would be installed without actually installing anything:

```bash
./setup.sh --dry-run
```

---

## Project Structure

```
first-setup/
├── setup.sh        # Main orchestrator
├── settings.sh     # GNOME desktop settings
├── config.sh       # User configuration
├── lib/
│   └── utils.sh    # Shared utility functions
└── packages/
    ├── chrome.sh
    ├── docker.sh
    ├── git.sh
    ├── nodejs.sh
    ├── postman.sh
    ├── remmina.sh
    ├── vs-code.sh
    └── zsh.sh
```

To add a new package, create a `packagename.sh` file under `packages/` — setup.sh will detect it automatically.
