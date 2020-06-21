# make sure to source color-codes.sh first!
[ -z "$color_reset" ] && echo >&2 "Warning: color-codes.sh was not sourced!" 

c0="$pcolor_resetBold"
c1="${pcolor_bold}${pcolor_fgBlue}"
c2="$pcolor_fgRed"
c3="$pcolor_fgGreen"
PS1="${c1}\u${c0}${c2}@${c0}${c1}\h${c0} ${c2}\W${c0}${c3}"'$(__git_ps1)'"${c0} ${c1}\$${pcolor_reset} "
PS2="${c1}>${pcolor_reset} "
unset c0 c1 c2 c3

# variables to configure __git_ps1 (in PS1)
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=verbose

