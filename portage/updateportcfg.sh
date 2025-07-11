#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp /var/lib/portage/world     $HOME/dot/portage/;
	cp /etc/portage/make.conf     $HOME/dot/portage/;
	cp /etc/portage/savedconfig   $HOME/dot/portage/savedconfig -r;
fi"
