
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
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

# -f : foreground colour
# -b : background colour
# -t : text
function prompt_machine() {
    p10k segment -f 200 -b 9 -t 'MacOS'
}


# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    osx
    composer
    common-aliases
    node
    npm
    vscode
)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# POWERLINE Customisation
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( os_icon dir vcs )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status package nodeenv:node_version phpenv:php_version terraform azure vim_shell)
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND=009
POWERLEVEL9K_DIR_FOREGROUND=007
POWERLEVEL9K_DIR_BACKGROUND=234
POWERLEVEL9K_MACHINE_FOREGROUND=016
POWERLEVEL9K_MACHINE_BACKGROUND=012
POWERLEVEL9K_VCS_FOREGROUND=159
POWERLEVEL9K_VCS_BACKGROUND=235
POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf79f 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"
POWERLEVEL9K_INSTANT_PROMPT=quiet
POWERLEVEL9K_MODE="nerdfont-complete"

# SECRETS for TERRAFORM / DIGITALOCEAN / ETC
$SECRETS
if [[ -f "$SECRETS" ]]
then
  source ~/.secrets
fi

# ENVIRONMENT VARIABLES
source ~/scripts__tools/scripts/zsh/environment_variables

# ALIASES
source ~/scripts__tools/scripts/zsh/aliases

# PATHS
source ~/scripts__tools/scripts/zsh/path

# SYMLINKS
source ~/scripts__tools/scripts/zsh/symlinks

# SYMLINKS for DOTFILES
source ~/scripts__tools/scripts/zsh/dotfiles

# System-specified script for overrides
SECRETS=~/.secrets
if [[ -f "$SECRETS" ]]
then
    source ~/.secrets
fi

# KEEP AT BOTTOM
# System-specified script for overrides
CUSTOM=~/.zshrc.custom
if [[ -f "$CUSTOM" ]]
then
    source ~/.zshrc.custom
fi

~/scripts__tools/scripts/zsh/motd.sh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
