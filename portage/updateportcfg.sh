#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp /var/lib/portage/world                 $HOME/dot/portage/;
	cp /etc/portage/make.conf                 $HOME/dot/portage/;
	cp /etc/portage/savedconfig               $HOME/dot/portage/ -r;
	cp /etc/portage/profile                   $HOME/dot/portage/ -r;
	cp /etc/portage/repos.conf                $HOME/dot/portage/ -r;
	cp /etc/portage/binrepos.conf             $HOME/dot/portage/ -r;
	cp /etc/portage/package.license           $HOME/dot/portage/;
	cp /etc/portage/package.use               $HOME/dot/portage/ -r;
	cp /etc/portage/package.mask              $HOME/dot/portage/ -r;
	cp /etc/portage/package.accept_keywords   $HOME/dot/portage/ -r;
	cp /etc/portage/package.env               $HOME/dot/portage/ -r;
fi"
