# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.aliases_33 ]; then
    source ~/.aliases_33
fi

if [ -f ~/.env_vars ]; then
    source ~/.env_vars
fi

# Run MOTD
/usr/local/bin/neofetch
/usr/local/bin/motd