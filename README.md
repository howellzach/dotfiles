# Dotfiles

Setup on a new machine:
```
$ alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ echo ".dotfiles" >> .gitignore
$ git clone --bare <git-repo-url> $HOME/.dotfiles/
$ config checkout
$ config config --local status.showUntrackedFiles no
```

If you hit an error message saying you have existing configuration files on your machine in locations that are already tracked by Git, run the following to rename and move those files:
```
$ mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Setup inspired by https://www.atlassian.com/git/tutorials/Dotfiles
## Setup Steps
### zsh
1. Install [Oh My Zsh](https://ohmyz.sh/)
2. Install [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k)
3. Run `p10k configure to install fonts`

### Neovim
1. Install Neovim
2. Install [Packer](https://github.com/wbthomason/packer.nvim)
3. Open neovim and run `:PackerInstall`
