GREEN="%{$fg[green]%}"
RESET="%{$reset_color%}"

USER="$GREEN%n$RESET :: "
PWD="%3~"

PROMPT="$USER"
RPROMPT="%m $PWD"

alias battery = "cat /sys/class/power_supply/BAT0/capacity"