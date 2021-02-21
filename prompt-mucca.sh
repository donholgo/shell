# make sure to source color-codes.sh first!
[ -z "${color[reset]}" ] && echo >&2 "Warning: color-codes.sh was not sourced!" 

# mucca: blue/red/green on yellow
c0="${pcolor[resetBold]}"
c1="${pcolor[fgBlue]}"
c2="${pcolor[fgRed]}"
c3="${pcolor[fgGreen]}"
bg="${pcolor[bgLightYellow]}"
PS1="${bg}${c1}\u${c0}${c2}@${c0}${c1}\h${c0} ${c2}\w${c0}${c3}"'$(__git_ps1)'"${c0} ${c1}\$${pcolor[reset]} "
PS2="${bg}${c1}▶${pcolor[reset]} "
unset bg c0 c1 c2 c3

# variables to configure __git_ps1 (in PS1)
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=verbose

