#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cp $HOME/dot/portage/world                     /var/lib/portage/;               
	cp $HOME/dot/portage/make.conf                 /etc/portage/;               
	cp $HOME/dot/portage/savedconfig               /etc/portage/ -r;             
	cp $HOME/dot/portage/profile                   /etc/portage/ -r;                 
	cp $HOME/dot/portage/repos.conf                /etc/portage/ -r;              
	cp $HOME/dot/portage/binrepos.conf             /etc/portage/ -r;           
	cp $HOME/dot/portage/package.license					 /etc/portage/;         
	cp $HOME/dot/portage/package.use               /etc/portage/ -r;             
	cp $HOME/dot/portage/package.mask              /etc/portage/ -r;            
	cp $HOME/dot/portage/package.accept_keywords   /etc/portage/ -r; 
	cp $HOME/dot/portage/package.env               /etc/portage/ -r;             
fi"
