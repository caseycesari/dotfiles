# Git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# Show git branch in command prompt
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\u@\h \w$(__git_ps1) $ '

# Set $EDITOR
export EDITOR=vim

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Add local bin dir to path
export PATH=~/.bin:$PATH

# Aliases
alias vbox='VBoxManage'
alias windev='VBoxManage startvm WindowsDevSlim'
alias v='vagrant'
