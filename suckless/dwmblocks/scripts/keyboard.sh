#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r layout_mask=$(xset -q | grep LED | awk '{ print $10 }')

case $layout_mask in
  "00000000" | "00000001")
      echo -n "EN"
      ;;

  "00001000" | "00001001")
       echo -n "RU"
       ;;

  *)
      echo -n "??"
      ;;
esac
