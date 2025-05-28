alias ..=up
alias ...='cd ../..'
alias 664='chmod 664'
alias 775='chmod 775'
alias 775+664='find . -type d -exec chmod 775 {} + ; find . -type f -exec chmod 664 {} +'
alias apt-all='sudo bash -c "apt update && apt upgrade --autoremove --purge && apt clean"'
alias dfh='df -H'
alias dussi='du -s --si'
alias l=less
alias ll='ls -l'
alias lr='ls -ltr'
alias md='mkdir'
alias rp='realpath'
alias vip='vi -p'
alias xon='xdg-open "$(newest)"'

type2vi() {
  if [ $# -ne 1 ]; then
    echo >&2 "Exactly one argument must be given."
    return 1
  fi
  local file=$(type -p "$1")
  if [ -n "$file" ]; then
    vi "$file"
  else
    type "$1"
  fi
}

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
  local targetdir

  # One argument
  if [ $# -eq 1 ]; then

    # If it starts with '-', call the builtin
    # (no need to implement option handling here).
    if [[ "$1" == -* ]]; then
      builtin cd "$@"
      return
    fi

    # If the argument is a *file*,
    # cd to the parent directory.
    if [ -f "$1" ]; then
      targetdir=$(dirname -- "$1")
      printf '%s\n' "$targetdir"
      builtin cd "$targetdir"
      return
    fi

    # If the argument
    #   - is a relative path (not containing '.' or '..')
    #   - and does not exist in $PWD,
    # try to find it under the parent, grandparent
    # etc. directory.
    if [[ "$1" != /* ]] && ! [[ "$1" =~ (^|/)\.\.?(/|$) ]] && [ ! -e "$1" ]; then
      local parent=$PWD
      until [ -z "$parent" ]; do
        parent=$(dirname -- "$parent")
        [ "$parent" = '/' ] && parent=''
        targetdir="$parent/$1"
        if [ -e "$targetdir" ]; then
          printf '%s\n' "$targetdir"
          builtin cd "$targetdir"
          return
        fi
      done
    fi

    # If
    #   - $1 is numeric (meaning [0-9]+),
    #   - the current directory has a name of the form PREFIX-NNN with numeric NNN
    #   - and there is a sibling directory PREFIX-$1,
    # change into that sibling directory.
    integer_re='^[0-9]+$'
    if [[ "$1" =~ $integer_re ]]; then
      local base=$(basename -- "$PWD")
      local prefix=${base%-*}
      local suffix=${base##*-}
      targetdir="../${prefix}-${1}"
      if [[ $suffix =~ $integer_re ]] && [[ -d "$targetdir" ]]; then
        printf '%s\n' "$targetdir"
        builtin cd "$targetdir"
        return
      fi
    fi

  # Two arguments: replace (the first occurrence of) $1
  # with $2 in $PWD.
  elif [ $# -eq 2 ]; then
    targetdir=${PWD/$1/$2}
    printf '%s\n' "$targetdir"
    builtin cd "$targetdir"
    return
  fi

  # Default behavior: call the builtin.
  builtin cd "$@"
}

alias cd=_hwcd
