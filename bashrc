# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
# Put your fun stuff here.



#uncolored PS1="\D{%a}[\A]\u@\h \w$ "
#coloring \[\e[$MD;$FG;$BGm\]
#PS1="\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h \[\e[1;34m\]\w\[\e[0m\]$\[\e[0m\] "
PS1="\[\e[36m\]\u\[\e[0m\] \[\e[1;34m\]\w \[\e[0m\]$\[\e[0m\] "


if [ $(cat /home/santi/dot/initvar) -eq 1 ]
then
	xkbcomp /home/santi/.xkb-custom $DISPLAY
	xset r rate 180 70
	xbacklight -set 50
	clear
	PROMPT_COMMAND="neofetch
					xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) -format _NET_WM_NAME 8s -set _NET_WM_NAME  'st'
					xprop -root -set WM_NAME  'dwm'
					PROMPT_COMMAND=''"
	echo 0 > "/home/santi/dot/initvar"
fi


