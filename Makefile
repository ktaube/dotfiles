isntall: install-vim install-zsh install-python install-bash \
	 install-git install-tmux

install-vim:
	sh vim/submodule_init
	rm ~/.vim ~/.vimrc
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc

install-python:
	rm ~/.pythonstartup.py
	ln -s `pwd`/python/pythonstartup.py ~/.pythonstartup.py

install-bash:
	rm ~/.profile ~/.bashrc
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/profile ~/.profile

install-git:
	rm ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-tmux:
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
	rm ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

install-zsh:
	rm ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc
