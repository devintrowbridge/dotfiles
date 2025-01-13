# .bashrc

function sourceif()
{
  if [ -f "$1" ]; then
    source "$1"
  fi
}

# Source global definitions
sourceif /etc/bashrc

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
sourceif "$HOME/.cargo/env"

# advanced tab completion
sourceif /etc/bash_completion

# Use GNU ls colors when tab-completing files
set colored-stats on

printf "%s\n" "USER: $(echo $USER)"
printf "%s\n" "DATE: $(date)"
printf "%s\n" "UPTIME: $(uptime -p)"
printf "%s\n" "HOSTNAME: $(hostname -f)"
printf "%s\n" "KERNEL: $(uname -rms)"
printf "%s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"


# shellcheck source=/home/devin/.aliases
sourceif $HOME/.aliases
sourceif $HOME/.env
sourceif $HOME/.keys
sourceif $HOME/.org

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

# uncomment for xforwarding
# export DISPLAY=$(ip route list default | awk '{print $3}'):0
# export LIBGL_ALWAYS_INDIRECT=1

