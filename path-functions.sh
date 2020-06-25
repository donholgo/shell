#!/bin/bash

# return 0 if PATH contains $1, 1 otherwise
path_contains() {
  case ":$PATH:" in
    *":$1:"*) return 0
      ;;
  esac
  return 1
}

path_remove() {
  for dir; do
    PATH=":$PATH:"
    PATH="${PATH//:$dir:/:}"
    PATH="${PATH//:$dir:/:}"
    PATH="${PATH#:}"
    PATH="${PATH%:}"
  done
}

path_append() {
  for dir; do
    path_remove "$dir"
    PATH="$PATH:$dir"
  done
}

path_append_unless_present() {
  for dir; do
    path_contains "$dir" || path_append "$dir"
  done
}

path_prepend() {
  for dir; do
    path_remove "$dir"
    PATH="$dir:$PATH"
  done
}

path_prepend_unless_present() {
  for dir; do
    path_contains "$dir" || path_prepend "$dir"
  done
}

