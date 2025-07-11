#!/bin/sh


DWM_V="dwm-6.5"
DMENU_V="dmenu-5.3"
ST_V="st-0.9.2"
SLOCK_V="slock-1.5"


if [ "$HOME" = "/root" ]
then
	exit
fi

cp /opt/dwm/$DWM_V/dwm.c /opt/$DWM_V/config.h           $HOME/dot/dwm/source/
cp /opt/dmwnu/$DMENU_V/dmenu.c /opt/$DMENU_V/config.h   $HOME/dot/dwm/dmenu/
cp /opt/st/$ST_V/config.h /opt/$ST_V/st.info            $HOME/dot/dwm/st/
