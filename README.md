# zsh-config
My config of the zsh Shell

Install via apt
```
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```
Install via pacman
```
sudo pacman -S zsh zsh-doc zsh-autosuggestions zsh-history-substring-search zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search
```
Get my config
```
wget -O ~/.zshrc https://raw.githubusercontent.com/BeanGreen247/dotfiles/master/zsh/zshrc
```
Change your default Shell to zsh
```
chsh -s $(which zsh)
```
in case these errors show up
```
.zshrc:source:112: no such file or directory: /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
.zshrc:source:145: no such file or directory: /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
do this
```
cd /usr/share/ 
sudo mkdir -p /usr/share/zsh/plugins
sudo mv zsh-autosuggestions zsh/plugins/
sudo mv zsh-syntax-highlighting zsh/plugins/
```
For a blue color scheme
```
PROMPT="%f%F{blue}{%F{cyan}%*%f%F{blue}}%f%F{azure}%m%f%F{blue}:%F{white}%~ %f%F{teal}%n %f%F{cyan}$ %F{white}%"
```
