set -x EDITOR nvim
set -x FISHCONFIG ~/.config/fish/config.fish
set -x TERMINAL alactritty
set -x XDG_CONFIG_HOME ~/.config
set -x VISUAL nvim
set -x GO111MODULE on
set -x GOPATH $HOME/code/go
set -x PATH $PATH $GOPATH/bin

# Configure my fancy prompt
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_NODE_SHOW true
set SPACEFISH_VI_MODE_SHOW true

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Aliases for common operations
# Refer to fishfile for additional plugins that may add aliases
## Docker Aliases
alias dcup 'docker-compose up'
alias dcdown 'docker-compose down'
alias dps 'docker ps'
alias dimages 'docker images'

# Use nvim as a replacement for vim 8
alias vim 'nvim'


