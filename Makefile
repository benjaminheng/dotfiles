.PHONY: desktop
desktop:
	stow -d desktop/ -t /home/ben \
		-R nvim \
		-R stow \
		-R tmux \
		-R zsh \
		-R delve \
		-R git \
		-R bin \
		-R cmus \
		-R alacritty \
		-R desktop-entries \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

desktop-installed-packages:
	pacman -Qe > desktop/do-not-stow/installed-packages
