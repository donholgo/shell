# make sure to source color-codes.sh first!
[ -z "${color[reset]}" ] && echo >&2 "Warning: color-codes.sh was not sourced!" 

# blue/red/green on white
bg="${pcolor[bgWhite]}"
c1="${pcolor[fgBlue]}"
c2="${pcolor[fgRed]}"
c3="${pcolor[fgGreen]}"
PS1="${bg}${c1}\u${c2}@${c1}\h ${c2}\w${c3}"'$(__git_ps1)'" ${c1}\$${pcolor[reset]} "
PS2="${bg}${c1}▶${pcolor[reset]} "
unset bg c1 c2 c3

# variables to configure __git_ps1 (in PS1)
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=verbose

