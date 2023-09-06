.PHONY: desktop
desktop:
	stow -d desktop/ -t /home/ben \
		-R nvim \
		-R stow \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)
