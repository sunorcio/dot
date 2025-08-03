#!/bin/sh


su -c "
if [ '$HOME' != '/root' ];
then
	cd /opt;
	wget https://github.com/jesseduffield/lazygit/releases/download/v0.54.0/lazygit_0.54.0_linux_x86_64.tar.gz;
	tar -xzf lazygit_0.54.0_linux_x86_64.tar.gz --one-top-level=lazygitdir;
	cp lazygitdir/lazygit /usr/bin/;
	rm lazygit_0.54.0_linux_x86_64.tar.gz;
	git clone https://github.com/brendangregg/FlameGraph;
fi"
