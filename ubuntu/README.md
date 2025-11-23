# Ubuntu Configuration

Configuration files, scripts, and system settings for Ubuntu.

## Structure

### Dotfiles
- `.bashrc` - Bash shell configuration with aliases and environment settings
- `.dircolors` - Custom color scheme for ls and directory listings
- `.vimrc` - Vim editor configuration
- `.muttrc` - Mutt email client configuration

### Application Configs (`.config/`)
- `nvim/` - Neovim configuration
- `zathura/` - PDF viewer settings
- `zellij/` - Terminal workspace manager configuration
- `starship.toml` - Starship prompt customization

### System Configuration (`etc/`)
- `systemd/` - Custom systemd service files

### Installation Scripts (`install_scripts/`)
Setup scripts for various tools and system configurations:
- `build_basics_install.sh` - Essential build tools and development packages
- `cuda_install.sh` - NVIDIA CUDA toolkit setup
- `grub_customizer_init.sh` - GRUB bootloader customization
- `mount_backup_partition_manually.sh` - Backup partition mounting utility
- `nvm_npm_install.sh` - Node Version Manager and npm setup
- `select_best_mirror.sh` - APT mirror optimization
- `starship_install.sh` - Starship prompt installation
- `swap_file_config.sh` - Swap file configuration
- `texlive_install.sh` - TeX Live distribution setup


