install: init \
         install-zsh \
         install-bash \
         install-git \
         install-tmux \
         install-vim \
      	 install-nvim

init:
	git submodule init
	git submodule update
	git submodule foreach git submodule init
	git submodule foreach git submodule update

install-nvim:
	mkdir -p ~/.config/nvim
	mv ~/.config/nvim/init.lua ~/.config/nvim/init_bak.lua || true
	ln -s `pwd`/nvim/init.lua ~/.config/nvim/init.lua || true
	ln -s `pwd`/nvim/lua ~/.config/nvim/lua || true

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
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./zsh/oh-my-zsh/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ./zsh/oh-my-zsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions ./zsh/oh-my-zsh/plugins/zsh-completions

.PHONY: init intall-vim install-bash install-git install-tmux install-zsh

