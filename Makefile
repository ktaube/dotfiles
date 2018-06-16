install: init \
         install-zsh \
         install-bash \
         install-git \
         install-tmux \
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
	vim +BundleInstall +Helptags

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

.PHONY: init intall-vim install-bash install-git install-tmux install-zsh