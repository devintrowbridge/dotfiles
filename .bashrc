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
  . "$HOME/.cargo/env"
fi

# advanced tab completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Use GNU ls colors when tab-completing files
set colored-stats on

source .aliases
source .env

if [ -f "org/.bashrc" ] ; then 
  source org/.bashrc
fi