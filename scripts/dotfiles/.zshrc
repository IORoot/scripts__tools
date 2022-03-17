# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -f : foreground colour
# -b : background colour
# -t : text
function prompt_machine() {
    p10k segment -f 200 -b 9 -t 'MacOS'
}

# Plugins to run
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    macos
    composer
    common-aliases
    node
    npm
    vscode
)

#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $ZSH/oh-my-zsh.sh


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

source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.env_vars ]; then
    source ~/.env_vars
fi