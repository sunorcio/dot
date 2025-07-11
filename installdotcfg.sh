#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp $HOME/dot/bashrc         $HOME/.bashrc;
	cp $HOME/dot/bash_profile   $HOME/.bash_profile;
	cp $HOME/dot/xinitrc        $HOME/.xinitrc;
	cp $HOME/dot/asoundrc       $HOME/.asoundrc;
	cp $HOME/dot/init.vim       $HOME/.config/nvim/init.vim;
fi"
