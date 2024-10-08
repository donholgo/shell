alias ..=up
alias ...='cd ../..'
alias 664='chmod 664'
alias 775='chmod 775'
alias 775+664='find . -type d -exec chmod 775 {} + ; find . -type f -exec chmod 664 {} +'
alias apt-all='sudo bash -c "apt update && apt upgrade && apt autoremove && apt clean"'
alias dfh='df -H'
alias dussi='du -s --si'
alias l=less
alias ll='ls -l'
alias lr='ls -ltr'
alias md='mkdir'
alias rp='realpath'
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
  local levels=1
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

inc() {
  local increment=${1:-1}
  local here=$(pwd)
  local base=""
  local number=$here
  if [[ $here =~ ^(.*[^0-9])([0-9]+)$ ]]; then
    base=${BASH_REMATCH[1]}
    number=${BASH_REMATCH[2]}
  fi
  cd "$base$(( number + increment ))"
}
alias cd+=inc

dec() {
  local decrement=${1:-1}
  inc "-$decrement"
}

strlen() {
  echo ${#1}
}

# cd with some extended functionality
_hwcd() {
  # If there is no argument or if the first
  # argument starts with a '-', call the
  # builtin.
  if [ $# -eq 0 ] || [[ "$1" == -* ]]; then
    builtin cd "$@"

  # If there is *one* argument and it's a *file*,
  # switch to the parent directory.
  elif [ $# -eq 1 ] && [ -f "$1" ]; then
    builtin cd "$(dirname -- "$1")"

  # If there is one argument which
  #   - is a relative path
  #   - and does not exist in $PWD,
  # try to find it under the parent, grandparent
  # etc. directory.
  elif [ $# -eq 1 ] && [[ "$1" != /* ]] && [ ! -e "$1" ]; then
    parent=$PWD
    until [ -z "$parent" ]; do
      parent=$(dirname -- "$parent")
      [ "$parent" == '/' ] && parent=''
      if [ -e "$parent/$1" ]; then
        builtin cd "$parent/$1"
        break
      fi
    done

  # With two arguments, replace (the first occurrence of) $1
  # with $2 in $PWD.
  elif [ $# -eq 2 ]; then
    builtin cd "${PWD/$1/$2}"

  # In any other case, call the builtin.
  else
    builtin cd "$@"
  fi
}

alias cd=_hwcd
