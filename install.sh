#/bin/sh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -svf ${BASEDIR}/.bashrc ~/.bashrc
ln -svf ${BASEDIR}/.bash_profile ~/.bash_profile
ln -svf ${BASEDIR}/.gitconfig ~/.gitconfig
ln -svf ${BASEDIR}/.gitignore ~/.gitignore
ln -svf ${BASEDIR}/.tmux.conf ~/.tmux.conf
ln -svf ${BASEDIR}/.vimrc ~/.vimrc
ln -svf ${BASEDIR}/.env ~/.env
ln -svf ${BASEDIR}/.aliases ~/.aliases
