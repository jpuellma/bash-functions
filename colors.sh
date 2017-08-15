# vim:filetype=sh

# tput:
# tput setab N = bg color
# tput setaf N = fg color
#    colors
#    0 = black
#    1 = red
#    2 = green
#    3 = yellow
#    4 = blue
#    5 = purple
#    6 = cyan
#    7 = white
# tput bold = bold
# tput dim = dim
# tput smul = set underline
# tput rmul = exit underline
# tput rev = reverse
# tput smso = set standout
# tput rmso = exit standout
# tput sgr0 = reset all
#

# tput_reset="\[$(tput sgr0)\]"
# tput_set_bold="\[$(tput bold)\]"
# tput_set_dim="\[$(tput dim)\]"
# tput_set_ul="\[$(tput smul)\]"
# tput_unset_ul="\[$(tput rmul)\]"
# tput_set_reverse="\[$(tput rev)\]"
# tput_set_standout="\[$(tput smso)\]"
# tput_unset_standout="\[$(tput rmso)\]"
# tput_bg_black="\[$(tput setab 0)\]"
# tput_bg_red="\[$(tput setab 1)\]"
# tput_bg_green="\[$(tput setab 2)\]"
# tput_bg_yellow="\[$(tput setab 3)\]"
# tput_bg_blue="\[$(tput setab 4)\]"
# tput_bg_purple="\[$(tput setab 5)\]"
# tput_bg_cyan="\[$(tput setab 6)\]"
# tput_bg_white="\[$(tput setab 7)\]"
# tput_fg_black="\[$(tput setaf 0)\]"
# tput_fg_red="\[$(tput setaf 1)\]"
# tput_fg_green="\[$(tput setaf 2)\]"
# tput_fg_yellow="\[$(tput setaf 3)\]"
# tput_fg_blue="\[$(tput setaf 4)\]"
# tput_fg_purple="\[$(tput setaf 5)\]"
# tput_fg_cyan="\[$(tput setaf 6)\]"
# tput_fg_white="\[$(tput setaf 7)\]"

tput_bg_black="$(tput setab 0)"
tput_bg_blue="$(tput setab 4)"
tput_bg_cyan="$(tput setab 6)"
tput_bg_green="$(tput setab 2)"
tput_bg_purple="$(tput setab 5)"
tput_bg_red="$(tput setab 1)"
tput_bg_white="$(tput setab 7)"
tput_bg_yellow="$(tput setab 3)"
tput_fg_black="$(tput setaf 0)"
tput_fg_blue="$(tput setaf 4)"
tput_fg_cyan="$(tput setaf 6)"
tput_fg_green="$(tput setaf 2)"
tput_fg_purple="$(tput setaf 5)"
tput_fg_red="$(tput setaf 1)"
tput_fg_white="$(tput setaf 7)"
tput_fg_yellow="$(tput setaf 3)"
tput_reset="$(tput sgr0)"
tput_set_bold="$(tput bold)"
tput_set_dim="$(tput dim)"
tput_set_reverse="$(tput rev)"
tput_set_standout="$(tput smso)"
tput_set_ul="$(tput smul)"
tput_unset_standout="$(tput rmso)"
tput_unset_ul="$(tput rmul)"

export tput_bg_black tput_bg_blue tput_bg_cyan tput_bg_green tput_bg_purple
export tput_bg_red tput_bg_white tput_bg_yellow tput_fg_black tput_fg_blue
export tput_fg_cyan tput_fg_green tput_fg_purple tput_fg_red tput_fg_white
export tput_fg_yellow tput_reset tput_set_bold tput_set_dim tput_set_reverse
export tput_set_standout tput_set_ul tput_unset_standout tput_unset_ul
