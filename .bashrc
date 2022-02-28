# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Rust
if [ -f "$HOME/.cargo" ]; then
  source "$HOME/.cargo/env"
fi

# advanced tab completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Use GNU ls colors when tab-completing files
set colored-stats on

source $HOME/.aliases
source $HOME/.env

if [ -f "org/.bashrc" ] ; then 
  source org/.bashrc
fi