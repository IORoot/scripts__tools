# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH
ZSH_THEME="powerlevel10k/powerlevel10k"

function prompt_machine() {
    p10k segment -f 200 -b 9 -t 'MacOS'
}


# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    z
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# POWERLINE Customisation
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( os_icon machine dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( host context )
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND=009
POWERLEVEL9K_MACHINE_FOREGROUND=016
POWERLEVEL9K_MACHINE_BACKGROUND=012
POWERLEVEL9K_VCS_BACKGROUND=236
POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf79f 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"


# SECRETS for TERRAFORM / DIGITALOCEAN
source ~/.secrets

# ALIASES
source ~/scripts__tools/scripts/zsh/aliases.sh

# PATHS
source ~/scripts__tools/scripts/zsh/path.sh

# SYMLINKS
source ~/scripts__tools/scripts/zsh/symlinks.sh