# zsh-config
My config of the zsh Shell

Install
```
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```
Get my config
```
wget -O ~/.zshrc https://raw.githubusercontent.com/BeanGreen247/zsh-config/master/zshrc
```
Get my zprofile
```
wget -O ~/.zprofile https://raw.githubusercontent.com/BeanGreen247/zsh-config/master/zprofile
```
Change your default Shell to zsh
```
chsh -s $(which zsh)
```