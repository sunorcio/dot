#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp $HOME/dot/font/128p_8x16_IBM_VGA.bmp        /usr/local/share/fonts/;
	cp $HOME/dot/font/BmPlus_ToshibaSat_8x16.otb   /usr/local/share/fonts/;
	cp $HOME/dot/font/tershn16.pcf                 /usr/local/share/fonts/;
	cp $HOME/dot/font/tershn16b.pcf                /usr/local/share/fonts/;
	fc-cache;
fi"
