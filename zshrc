export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="arrow"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="hh:mm:ss"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker debian go npm python pyenv ruby vscode)

source $ZSH/oh-my-zsh.sh

# User configuration
# export LANG=en_US.UTF-8
