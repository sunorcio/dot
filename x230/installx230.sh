#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp $HOME/dot/x230/xorg.conf.d   /etc/X11/ -r;
	cp $HOME/dot/x230/pointer       /etc/init.d/;
	rc-update add pointer default;
fi"
