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
if [ $(cat ~/dot/initvar) -eq 1 ]
then
	xbacklight -set 70
	xset r rate 180 70
	xkbcomp ~/.xkb-custom $DISPLAY
	clear
	PROMPT_COMMAND="neofetch
					PROMPT_COMMAND='' "
	echo 0 > ~/dot/initvar
fi



alias qlist='qlist --color'
#alias eix='eix -F'
alias emerge="emerge --color y"
alias ls="ls --color=always"
alias grep="grep --color=always"

alias sudo="~/00_past/shcmd/sudo"
alias gitclone="~/00_past/shcmd/gitclone"
alias wpa="~/00_past/shcmd/wpa"
alias modlist="~/00_past/shcmd/modlist"
alias cm="~/00_past/shcmd/cmath"
alias torrent="~/00_past/shcmd/torrent"
alias lazygit="~/go/bin/lazygit"
