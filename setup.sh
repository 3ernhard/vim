#!/bin/bash
mkdir -p ~/.local/state/vim/backup \
	~/.local/state/vim/swap \
	~/.local/state/vim/undo
vimx -c 'helptags ALL' -c 'q'
