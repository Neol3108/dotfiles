export ZSH="/Users/noel/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git aws composer common-aliases)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

export PATH=$PATH:~/.composer/vendor/bin
