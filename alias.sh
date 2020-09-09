alias ..='cd ..'
alias ...='cd ../..'
alias 664='chmod 664'
alias 775='chmod 775'
alias 775+664='find . -type d -exec chmod 775 {} + ; find . -type f -exec chmod 664 {} +'
alias df.='df -H .'
alias ll='ls -l'
alias md='mkdir'
alias vip='vi -p'
alias xon='xdg-open "$(newest)"'

mcd() {
  if [[ $# -eq 1 ]]; then
    mkdir -p "$1" && cd "$1"
  else
    echo >&2 "${FUNCNAME[0]}: exactly one argument required."
    return 1
  fi
}

up() {
  levels=1
  if [[ $# -ne 0 ]]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
      levels=$1
    else
      echo >&2 "${FUNCNAME[0]}: argument must be a non-negative integer."
      return 1
    fi
  fi

  local dir=""
  while (( levels-- )); do
    dir="../$dir"
  done
  [[ -n $dir ]] && cd "$dir"
}

vir() {
  if [[ $# -eq 0 ]]; then
    vi -R -
  else
    vi -Rp "$@"
  fi
}


xo() {
  for file; do
    xdg-open "$file"
  done
}

