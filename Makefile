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
		-R rofi \
		-R mpv \
		-R yt-dlp \
		-R fish \
		-R feh \
		-R jj \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

.PHONY: laptop-fw12
laptop-fw12:
	stow -d laptop-fw12/ -t /home/ben \
		-R nvim \
		-R stow \
		-R tmux \
		-R fish \
		-R rofi \
		-R git \
		-R jj \
		-R ghostty \
		-R desktop-entries \
		-R mpv \
		-R feh \
		-R bin \
		-R cmus \
		-R yt-dlp \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

.PHONY: laptop-pocket3
laptop-pocket3:
	stow -d laptop/ -t /home/ben \
		-R nvim \
		-R stow \
		-R tmux \
		-R delve \
		-R git \
		-R bin \
		-R cmus \
		-R alacritty \
		-R desktop-entries \
		-R rofi \
		-R mpv \
		-R yt-dlp \
		-R fish \
		-R feh \
		-R delve \
		-R yt-dlp \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

desktop-installed-packages:
	pacman -Qe > desktop/do-not-stow/installed-packages
	jj commit -m "Update desktop installed packages"

laptop-pocket3-installed-packages:
	pacman -Qe > laptop/do-not-stow/installed-packages
	git add laptop/do-not-stow/installed-packages
	git commit -m "Update laptop installed packages"

laptop-fw2-installed-packages:
	jj git fetch
	jj new master
	pacman -Qe > laptop-fw12/do-not-stow/installed-packages
	jj commit -m "Update laptop installed packages"
