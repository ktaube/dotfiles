install: init \
         install-zsh \
         install-bash \
         install-git \
         install-tmux \
         install-python \
         install-vim

init:
	git submodule init
	git submodule update
	git submodule foreach git submodule init
	git submodule foreach git submodule update

install-vim:
	mv ~/.vim /tmp/.vim_bak || true
	mv ~/.vimrc /tmp/.vimrc_bak || true
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	vim +BundleInstall +Helptags +qall

install-python:
	mv ~/.pythonstartup.py /tmp/.pythonstartup.py_bak || true
	ln -s `pwd`/python/pythonstartup.py ~/.pythonstartup.py

install-bash:
	mv ~/.profile /tmp/.profile_bak || true
	mv ~/.bashrc /tmp/.bashrc_bak || true
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/profile ~/.profile

install-git:
	mv ~/.gitconfig /tmp/.gitconfig_bak || true
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-tmux:
	ln -s `pwd`/tmux/basic.sh `pwd`/tmux/tmux-powerline/themes/basic_tmp.sh || true
	mv ~/.tmux.conf /tmp/.tmux.conf_bak || true
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

install-zsh:
	mv ~/.zshrc /tmp/.zshrc_bak || true
	ln -s `pwd`/zsh/zshrc ~/.zshrc

install-ubuntu:
	sudo apt-get install -y vim git-core zsh tmux xclip tree ack-grep

set-pycharm-config:
	cp -r pycharm/config ~/.PyCharm30

download-gnome-solarized:
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.gnome_solarized
