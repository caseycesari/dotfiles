# Git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Show git branch in command prompt
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\u@\h \w$(__git_ps1) $ '

# Set $EDITOR
export EDITOR=vim

# Add Julia to the path
export PATH=/Applications/Julia-0.3.11.app/Contents/Resources/julia/bin/:$PATH

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-railscast.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
