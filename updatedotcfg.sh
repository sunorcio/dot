#!/bin/sh


if [ "$HOME" = "/root" ]
then
	exit
fi

cp $HOME/.bashrc                 $HOME/dot/bashrc
cp $HOME/.bash_profile           $HOME/dot/bash_profile
cp $HOME/.xinitrc                $HOME/dot/xinitrc
cp $HOME/.asoundrc               $HOME/dot/asoundrc
cp $HOME/.config/nvim/init.vim   $HOME/dot/init.vim
