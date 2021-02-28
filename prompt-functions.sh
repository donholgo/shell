# shell functions to manipluate PS1:
# switch between \w and \W, set PROMPT_DIRTRIM

hide-path() {
  # replace \w with \W (only basename)
  PS1="${PS1/\\w/\\W}"
}

show-path() {
  if [[ $# -eq 1 ]]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
      PROMPT_DIRTRIM=$1
    else
      printf >&2 "%s: illegal argument '%s' (only numbers allowed).\n" "${FUNCNAME[0]}" "$1"
      return 1
    fi
  fi

  # replace \W with \w (full path, but possibly shortened)
  PS1="${PS1/\\W/\\w}"
}

