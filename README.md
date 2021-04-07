# zsh-config
My config of the zsh Shell

Install via apt
```
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```
Install via pacman
```
sudo pacman -S zsh zsh-doc zsh-autosuggestions zsh-history-substring-search zsh-completions
```
Get my config
```
wget -O ~/.zshrc https://raw.githubusercontent.com/BeanGreen247/dotfiles/master/zsh/zshrc
```
Change your default Shell to zsh
```
chsh -s $(which zsh)
```
