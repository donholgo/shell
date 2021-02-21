# make sure to source color-codes.sh first!
[ -z "${color[reset]}" ] && echo >&2 "Warning: color-codes.sh was not sourced!" 

# white on magenta/blue/green
c="${pcolor[fgWhite]}"
b1="${pcolor[bgMagenta]}"
b2="${pcolor[bgBlue]}"
b3="${pcolor[bgGreen]}"
PS1="${c}${b1}\u${b2}@${b1}\h ${b2}\w${b3}"'$(__git_ps1)'"${b1} \$${pcolor[reset]} "
PS2="${b1}${c}> ${pcolor[reset]} "
unset c b1 b2 b3

# variables to configure __git_ps1 (in PS1)
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=verbose

