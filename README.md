# Dotfiles

This repository contains my personal dotfiles, configurations, and scripts for customizing my Linux environment. Dotfiles are configuration files and directories (often starting with a dot) that customize the behavior and appearance of various programs and utilities on the Linux system.

## Redeployment Instructions

To start using this repository to manage your dotfiles, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone --bare https://github.com/praneeth-katuri/dotfiles.git $HOME/.dotfiles
   ```

2. **Set Up Git Alias:**
   Set up an alias named 'dotfiles' to simplify managing dotfiles with Git.
   ```bash
   alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
   ```

3. **Create a Backup Directory:**
   ```bash
   mkdir -p .dotfiles-backup
   ```

4. **Backup Existing Dotfiles and Checkout:**
   ```bash
   dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
   ```

5. **Suppress Untracked Files Warning:**
   ```bash
   dotfiles config --local status.showUntrackedFiles no
   ```

## Contributing
Contributions to this project are welcome! If you have any issues or ideas for improvements, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
