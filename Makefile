install: install-vim install-zsh install-python install-bash \
	 install-git install-tmux

install-vim:
	git submodule init
	git submodule update
	git submodule foreach git submodule init
	git submodule foreach git submodule update
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	# run 'git submodule update --init' in jedi-vim folder

install-python:
	rm -f ~/.pythonstartup.py
	ln -s `pwd`/python/pythonstartup.py ~/.pythonstartup.py

install-bash:
	rm -f ~/.profile ~/.bashrc
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/profile ~/.profile

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-tmux:
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true
	ln -s `pwd`/tmux/basic.sh `pwd`/tmux/tmux-powerline/themes/basic_tmp.sh || true
	rm -f ~/.tmux-powerlinerc
	ln -s `pwd`/tmux/tmux-powerlinerc ~/.tmux-powerlinerc
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

install-zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc

install-ubuntu:
	sudo apt-get install -y vim git-core zsh tmux xclip tree
