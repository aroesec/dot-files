DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh

export EDITOR=/usr/local/bin/nvim

export TERM=xterm-color

export TESSDATA_PREFIX=/usr/share/tessdata
export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin
export TERM=xterm-color
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export FrameworkPathOverride=$(which mono | rev | cut -d "/" -f3- | rev)
export PATH="$PATH:$HOME/bin"

ZSH_THEME="agnoster"

plugins=(
  git
)

alias vnv='virtualenv venv && source venv/bin/activate && pip install neovim flake8 black jedi'
alias vim="nvim"
alias vi="nvim"


# Fix annoying ctrl-s shit
stty -ixon

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias notary='echo "# $(date)" >> $HOME/notary.md && echo '' >> $HOME/notary.md && $EDITOR $HOME/notary.md'
alias notary_rm='rm -rf /home/drax/notary.md'
