# Git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Show git branch in command prompt
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\u@\h \w$(__git_ps1) $ '


# Set $EDITOR
export EDITOR=vim
