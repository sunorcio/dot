#!/bin/sh


DWM_V="dwm-6.5"
DMENU_V="dmenu-5.3"
ST_V="st-0.9.2"
SLOCK_V="slock-1.5"


su -c "
if [ '$HOME' != '/root' ];
then
	wget https://dl.suckless.org/dwm/$DWM_V.tar.gz -P /opt;
	wget https://dl.suckless.org/tools/$DMENU_V.tar.gz -P /opt;
	wget https://dl.suckless.org/st/$ST_V.tar.gz -P /opt;
	wget https://dl.suckless.org/tools/$SLOCK_V.tar.gz -P /opt;
	tar -xvf /opt/$DWM_V.tar.gz --one-top-level=/opt/dwm;
	tar -xvf /opt/$DMENU_V.tar.gz --one-top-level=/opt/dmenu;
	tar -xvf /opt/$ST_V.tar.gz --one-top-level=/opt/st;
	tar -xvf /opt/$SLOCK_V.tar.gz --one-top-level=/opt/slock;
	rm /opt/$DWM_V.tar.gz -f;
	rm /opt/$DMENU_V.tar.gz -f;
	rm /opt/$ST_V.tar.gz -f;
	rm /opt/$SLOCK_V.tar.gz -f;
	cp $HOME/dot/dwm/batt   /opt/dwm/;
	cp $HOME/dot/dwm/source/dwm.c $HOME/dot/dwm/source/config.h   /opt/dwm/$DWM_V/;
	cd /opt/dwm/$DWM_V;
	make install clean;
	cp $HOME/dot/dwm/dmenu/dmenu.c $HOME/dot/dwm/dmenu/config.h   /opt/dmenu/$DMENU_V/;
	cd /opt/dmenu/$DMENU_V;
	make install clean;
	cp $HOME/dot/dwm/st/config.h $HOME/dot/dwm/st/st.info         /opt/st/$ST_V/;
	cd /opt/st/$ST_V;
	make install clean;
	cd /opt/slock/$SLOCK_V;
	make install clean;
fi"
