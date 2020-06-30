#!/bin/sh

declare -A color
declare -A pcolor

color[bgDefault]='\e[49m'
color[blink]='\e[5m'
color[bold]='\e[1m'
color[fgDefault]='\e[39m'
color[reset]='\e[0m'
color[resetBlink]='\e[25m'
color[resetBold]='\e[22m'
color[resetReverse]='\e[27m'
color[resetUnderline]='\e[24m'
color[reverse]='\e[7m'
color[underline]='\e[4m'

color[fg0]='\e[30m'
color[fgBlack]='\e[30m'
color[fgDarkGray]='\e[90m'
color[bg0]='\e[40m'
color[bgBlack]='\e[40m'
color[bgDarkGray]='\e[100m'

color[fg1]='\e[31m'
color[fgRed]='\e[31m'
color[fgLightRed]='\e[91m'
color[bg1]='\e[41m'
color[bgRed]='\e[41m'
color[bgLightRed]='\e[101m'

color[fg2]='\e[32m'
color[fgGreen]='\e[32m'
color[fgLightGreen]='\e[92m'
color[bg2]='\e[42m'
color[bgGreen]='\e[42m'
color[bgLightGreen]='\e[102m'

color[fg3]='\e[33m'
color[fgYellow]='\e[33m'
color[fgLightYellow]='\e[93m'
color[bg3]='\e[43m'
color[bgYellow]='\e[43m'
color[bgLightYellow]='\e[103m'

color[fg4]='\e[34m'
color[fgBlue]='\e[34m'
color[fgLightBlue]='\e[94m'
color[bg4]='\e[44m'
color[bgBlue]='\e[44m'
color[bgLightBlue]='\e[104m'

color[fg5]='\e[35m'
color[fgMagenta]='\e[35m'
color[fgLightMagenta]='\e[95m'
color[bg5]='\e[45m'
color[bgMagenta]='\e[45m'
color[bgLightMagenta]='\e[105m'

color[fg6]='\e[36m'
color[fgCyan]='\e[36m'
color[fgLightCyan]='\e[96m'
color[bg6]='\e[46m'
color[bgCyan]='\e[46m'
color[bgLightCyan]='\e[106m'

color[fg7]='\e[37m'
color[fgLightGray]='\e[37m'
color[fgWhite]='\e[97m'
color[bg7]='\e[47m'
color[bgLightGray]='\e[47m'
color[bgWhite]='\e[107m'

# prompt colors: color codes wrapped in \[...\] for use in PS1 etc.
pcolor[bg0]="\[${color[bg0]}\]"
pcolor[bg1]="\[${color[bg1]}\]"
pcolor[bg2]="\[${color[bg2]}\]"
pcolor[bg3]="\[${color[bg3]}\]"
pcolor[bg4]="\[${color[bg4]}\]"
pcolor[bg5]="\[${color[bg5]}\]"
pcolor[bg6]="\[${color[bg6]}\]"
pcolor[bg7]="\[${color[bg7]}\]"
pcolor[bgBlack]="\[${color[bgBlack]}\]"
pcolor[bgBlue]="\[${color[bgBlue]}\]"
pcolor[bgCyan]="\[${color[bgCyan]}\]"
pcolor[bgDarkGray]="\[${color[bgDarkGray]}\]"
pcolor[bgDefault]="\[${color[bgDefault]}\]"
pcolor[bgGreen]="\[${color[bgGreen]}\]"
pcolor[bgLightBlue]="\[${color[bgLightBlue]}\]"
pcolor[bgLightCyan]="\[${color[bgLightCyan]}\]"
pcolor[bgLightGray]="\[${color[bgLightGray]}\]"
pcolor[bgLightGreen]="\[${color[bgLightGreen]}\]"
pcolor[bgLightMagenta]="\[${color[bgLightMagenta]}\]"
pcolor[bgLightRed]="\[${color[bgLightRed]}\]"
pcolor[bgLightYellow]="\[${color[bgLightYellow]}\]"
pcolor[bgMagenta]="\[${color[bgMagenta]}\]"
pcolor[bgRed]="\[${color[bgRed]}\]"
pcolor[bgWhite]="\[${color[bgWhite]}\]"
pcolor[bgYellow]="\[${color[bgYellow]}\]"
pcolor[blink]="\[${color[blink]}\]"
pcolor[bold]="\[${color[bold]}\]"
pcolor[fg0]="\[${color[fg0]}\]"
pcolor[fg1]="\[${color[fg1]}\]"
pcolor[fg2]="\[${color[fg2]}\]"
pcolor[fg3]="\[${color[fg3]}\]"
pcolor[fg4]="\[${color[fg4]}\]"
pcolor[fg5]="\[${color[fg5]}\]"
pcolor[fg6]="\[${color[fg6]}\]"
pcolor[fg7]="\[${color[fg7]}\]"
pcolor[fgBlack]="\[${color[fgBlack]}\]"
pcolor[fgBlue]="\[${color[fgBlue]}\]"
pcolor[fgCyan]="\[${color[fgCyan]}\]"
pcolor[fgDarkGray]="\[${color[fgDarkGray]}\]"
pcolor[fgDefault]="\[${color[fgDefault]}\]"
pcolor[fgGreen]="\[${color[fgGreen]}\]"
pcolor[fgLightBlue]="\[${color[fgLightBlue]}\]"
pcolor[fgLightCyan]="\[${color[fgLightCyan]}\]"
pcolor[fgLightGray]="\[${color[fgLightGray]}\]"
pcolor[fgLightGreen]="\[${color[fgLightGreen]}\]"
pcolor[fgLightMagenta]="\[${color[fgLightMagenta]}\]"
pcolor[fgLightRed]="\[${color[fgLightRed]}\]"
pcolor[fgLightYellow]="\[${color[fgLightYellow]}\]"
pcolor[fgMagenta]="\[${color[fgMagenta]}\]"
pcolor[fgRed]="\[${color[fgRed]}\]"
pcolor[fgWhite]="\[${color[fgWhite]}\]"
pcolor[fgYellow]="\[${color[fgYellow]}\]"
pcolor[reset]="\[${color[reset]}\]"
pcolor[resetBlink]="\[${color[resetBlink]}\]"
pcolor[resetBold]="\[${color[resetBold]}\]"
pcolor[resetReverse]="\[${color[resetReverse]}\]"
pcolor[resetUnderline]="\[${color[resetUnderline]}\]"
pcolor[reverse]="\[${color[reverse]}\]"
pcolor[underline]="\[${color[underline]}\]"
