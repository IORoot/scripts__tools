# General
alias config="code ~/.zshrc"
alias lsalias="grep -in --color -e '^alias\s+*' ~/.zshrc | sed 's/alias //' | grep --color -e ':[a-z][a-z0-9]*'"
alias ll="ls -la"

# Software
alias php="/usr/local/bin/php"
alias composer="php /usr/local/bin/composer.phar"

# GIT
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gpp="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull)' \;"
alias gff="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git fetch)' \;"
alias gss="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git -c color.status=always status -s)' \;"

# SEARCH
alias search="find . | grep"
alias hunt="grep -rnw . -e "
alias top5='du -a . | sort -n -r | head -n 5'

# SHORTCUTS
alias clearlog="rm /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/debug.log"
alias logs="cd /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/"
alias plug="cd /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/plugins"
alias theme="cd /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/themes/londonparkour.com_v4"
alias watch="/usr/local/bin/sass --watch /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/themes/londonparkour.com_v4/sass/style.scss /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content/themes/londonparkour.com_v4/style.css"

# Work In Progress WIP
alias wipp='WIP=`pwd`'
alias wip='cd "$WIP"'

# SITES
alias lon="ssh root@londonparkour.com"
alias io="ssh root@ioroot.com"
alias igs="ssh root@157.245.42.123"

# PUPPET
alias papply="/opt/puppetlabs/bin/puppet apply --disable_warnings deprecations /etc/puppetlabs/code/environments/production/manifests/"
alias cdpuppet="cd /etc/puppetlabs/code/environments/production"

# PHPUNIT
alias pu="phpunit --testdox"
alias purun="phpunit --testdox --coverage-html tests/report"

# VAGRANT
alias cdvagrant="cd /Users/andrewpearson/Storage/Code/VMs/vagrant"

# DIRECTORIES
alias cdbin="cd /usr/local/bin"

# ZSH
alias reload="source ~/.zshrc"

# EXA
alias ll="exa --header --long --git --icons"
alias l="exa --header --long --git --tree --level=2 --icons"



# System-specified Aliases
if [[ -f "~/aliases.sh" ]]
then
    source ~/aliases.sh
fi