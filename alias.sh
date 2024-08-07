alias ..='cd ..'
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

# cd to "sibling" directory
cdsib() {
  if (( $# != 1 )); then
    echo >&2 "${FUNCNAME[0]}: exactly one argument required."
    return
  fi
  local suffix=$1
  local current=$(basename -- "$(pwd)")
  while [[ -n $current ]]; do
    current=${current:0:-1}
    sibling="../${current}${suffix}"
    if [[ -d $sibling ]]; then
      cd "$sibling"
      return
    fi
  done
  echo >&2 "${FUNCNAME[0]}: no sibling directory with suffix '${suffix}' found."
}


cd#() {
  local target=${1:-1}
  local here=$(pwd)
  local base=""
  if [[ $here =~ ^(.*[^0-9])([0-9]+)$ ]]; then
    base=${BASH_REMATCH[1]}
  fi
  cd "$base$target"
}
