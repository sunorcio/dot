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
PS1="\[\e[36m\]\u\[\e[0m\] \[\e[1;34m\]\$PWD \[\e[0m\]$\[\e[0m\] "



#xprop -root -set WM_NAME  'dwm'
#xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -b 41-) -f _NET_WM_NAME 8s -set _NET_WM_NAME "asdfasdf"
if [ $(cat /home/santi/dot/initvar) -eq 1 ]
then
	xbacklight -set 50
	xset r rate 180 70
	xkbcomp /home/santi/.xkb-custom $DISPLAY
	clear
	PROMPT_COMMAND="neofetch
					PROMPT_COMMAND='' "
	echo 0 > "/home/santi/dot/initvar"
fi



alias qlist='qlist --color'
alias qlist='eix -F'
alias emerge="emerge --color y"
