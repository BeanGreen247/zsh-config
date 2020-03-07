export ZSH=$HOME/.oh-my-zsh

setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt MENUCOMPLETE
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=10
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker debian go npm python pyenv ruby vscode)

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[yellow]%}%n%{$fg[magenta]%}@%{$fg[blue]%}%M %{$fg[green]%}%~%{$fg[white]%} "

# History in a seperate file
HISTSIZE=50000
SAVEHIST=50000
setopt extendedhistory   # save timestamp and duration
setopt histignorealldups # ignore duplicates
setopt histignorespace   # ignore lines which start with space
setopt incappendhistory  # incremental append
setopt sharehistory      # share history between zsh processes
## The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history_TM

# Custom alias
alias freeupspace='sudo apt clean -y && sudo apt autoremove -y && sudo apt autoclean && rm -rfv ~/.cache/*'
alias mkbuild='rm -rf build && mkdir build && cd build && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make -j4'
alias mkinstall='sudo make install'
alias dl='wget -r -e robots=off -nc -np'
alias ..='cd ..'
alias ...='cd ../../'
alias re='cd -'
alias myip="curl http://ipecho.net/plain; echo"
type gotop > /dev/null \
&& alias top='gotop'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'

## git

alias gitCommands="alias|grep git"
alias commands=gitCommands
alias gitconfig="$EDITOR $HOME/.gitconfig"
alias gitrc=gitconfig
alias gitignore="$EDITOR $HOME/.gitignore"
alias melt="git add --all && git commit --all --no-edit --amend"
alias resetToMaster="git fetch --all --prune && git reset --hard origin/master"
alias undo="git reset --soft HEAD~"
alias rebaseOnMaster="git fetch --all --prune && git rebase origin/master"
alias renameCommit="git commit --amend"
alias push="git push origin HEAD --force-with-lease"
alias wip="git add --all && git commit --all --message='wip: undo me! (eg: \"git reset --soft HEAD~\")'"
alias showBranchesByDate="git for-each-ref --sort=-committerdate refs/heads/"
alias news="git --no-pager log --decorate --oneline origin/master..HEAD"
alias fixupAll="git add --all && git commit --fixup "
alias fixup="git commit --fixup "
alias squashAll="git fetch origin && git rebase --autosquash origin/master"
alias nukeModifications="git reset --hard && git clean -d --force"
alias commit="git commit"
alias commitAll="git add --all && git commit"
alias master="git checkout master && git reset --hard origin/master"

# docker

alias docker-clean='docker container prune --force'
alias docker-clean-images='docker image prune --force --all'

# cd -[tab] (do not push duplicates, reverse order)
setopt autopushd pushdignoredups pushdminus

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
