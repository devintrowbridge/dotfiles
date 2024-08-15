# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# git
git config --global core.excludesfile $HOME/.gitignore
git config --global user.name "Devin Trowbridge"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Rust
if [ -d "$HOME/.cargo" ]; then
  source "$HOME/.cargo/env"
fi

# advanced tab completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Use GNU ls colors when tab-completing files
set colored-stats on

# shellcheck source=/home/devin/.aliases
source $HOME/.aliases
source $HOME/.env
source $HOME/.keys
source $HOME/.org

source "$HOME/.cargo/env"

# For podman temp files
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

export DISPLAY=$(ip route list default | awk '{print $3}'):0
export LIBGL_ALWAYS_INDIRECT=1
